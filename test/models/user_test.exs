defmodule Blabber.UserTest do
  use Blabber.ModelCase

  alias Blabber.User

  @valid_attrs %{
    email: "ryan@example.com",
    password: "12345",
    password_confirmation: "12345"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "mis-matched password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, Map.merge(@valid_attrs, %{password: "asdasdasdas"}))
    refute changeset.valid?
  end

  test "missing password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, Map.merge(@valid_attrs, %{password_confirmation: nil}))
    refute changeset.valid?
  end

  test "short password doesn't work" do
    changeset = User.changeset(%User{}, Map.merge(@valid_attrs, %{
              password: "asd", password_confirmation: "asd"}))

    refute changeset.valid?
  end
end
