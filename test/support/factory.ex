defmodule Blabber.Factory do
  use ExMachina.Ecto, repo: Blabber.Repo

  alias Blabber.{Room, User}

  def factory(:user) do
    %User{
      email: sequence(:email, &"email-#{&1}@example.com"),
      password: "123456",
      password_confirmation: "123456",
      password_hash: Comeonin.Bcrypt.hashpwsalt("123456")
    }
  end

  def factory(:room) do
    %Room{
      name: "Puppies!!!",
      owner: build(:user)
    }
  end
end
