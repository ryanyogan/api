defmodule Blabber.Factory do
  use ExMachina.Ecto, repo: Blabber.Repo

  alias Blabber.User

  def factory(:user) do
    %User{
      email: sequence(:email, &"email-#{&1}@example.com"),
      password: "123456",
      password_confirmation: "123456",
      password_hash: Comeonin.Bcrypt.hashpwsalt("123456")
    }
  end
end
