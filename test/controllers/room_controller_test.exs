defmodule Blabber.RoomControllerTest do
  use Blabber.ConnCase

  alias Blabber.Factory
  alias Blabber.Room

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    user = Factory.create(:user)

    { :ok, jwt, _full_claims } = Guardian.encode_and_sign(user, :token)

    conn = conn
    |> put_req_header("content-type", "application/vnd.api+json")
    |> put_req_header("authorization", "Bearer #{jwt}")

    {:ok, %{conn: conn, user: user}}
  end

  defp create_test_rooms(user) do
    Enum.each ["first room", "second room", "third room"], fn name ->
      Repo.insert! %Blabber.Room{owner_id: user.id, name: name}
    end

    other_user = Factory.create(:user)
    Enum.each ["fourth room", "fifth room"], fn name ->
      Repo.insert! %Blabber.Room{owner_id: other_user.id, name: name}
    end
  end

  test "lists all entries on index", %{conn: conn, user: user} do
    create_test_rooms(user)

    conn = get conn, room_path(conn, :index)
    assert Enum.count(json_response(conn, 200)["data"]) == 5
  end

  test "lists owned entries on index (owner_id == user id)", %{conn: conn, user: user} do
    create_test_rooms(user)

    conn = get conn, room_path(conn, :index, user_id: user.id)
    assert Enum.count(json_response(conn, 200)["data"]) == 3
  end

  test "shows chosen resource", %{conn: conn, user: user} do
    room = Repo.insert! %Room{owner_id: user.id}
    conn = get conn, room_path(conn, :show, room)
    assert json_response(conn, 200)["data"] == %{
      "id" => to_string(room.id),
      "type" => "room",
      "attributes" => %{
        "name" => room.name
      },
      "relationships" => %{
        "owner" => %{
          "links" => %{
            "related" => "http://localhost:4001/api/users/#{user.id}"
          }
        }
      }
    }
  end

end
