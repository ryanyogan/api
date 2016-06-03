defmodule Blabber.RoomTest do
  use Blabber.ModelCase

  alias Blabber.Room
  alias Blabber.Factory

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup do
    user = Factory.create(:user)

    {:ok, %{user: user}}
  end

  test "changeset with valid attributes", %{user: user} do
    changeset = Room.changeset(%Room{owner_id: user.id}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes", %{user: user} do
    changeset = Room.changeset(%Room{owner_id: user.id}, @invalid_attrs)
    refute changeset.valid?
  end
end
