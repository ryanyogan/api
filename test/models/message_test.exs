defmodule Blabber.MessageTest do
  use Blabber.ModelCase

  alias Blabber.Message
  alias Blabber.Factory

  setup do
    user = Factory.create(:user)
    room = Factory.create(:room, user: user)

    {:ok, %{user: user, room: room}}
  end

  test "empty params", %{user: user} do
    changeset = Message.changeset(%Message{author_id: user.id}, %{})
    refute changeset.valid?
  end

  test "only body", %{user: user} do
    changeset = Message.changeset(%Message{author_id: user.id}, %{body: "some content"})
    refute changeset.valid?
  end

  test "only body and owner", %{user: user} do
    changeset = Message.changeset(%Message{author_id: user.id}, %{body: "some content"})
    refute changeset.valid?
  end

  test "all valid fields", %{user: user, room: room} do
    changeset = Message.changeset(%Message{author_id: user.id, room_id: room.id}, %{body: "some content"})
    assert changeset.valid?
  end
end
