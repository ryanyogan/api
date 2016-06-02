defmodule Blabber.UserController do
  use Blabber.Web, :controller

  alias Blabber.User
  plug Guardian.Plug.EnsureAuthenticated, handler: Blabber.AuthErrorHandler

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.json", data: users)
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render(conn, "show.json", data: user)
  end
  def current(conn, _params) do
    user = conn
    |> Guardian.Plug.current_resource

    conn
    |> render(Blabber.UserView, "show.json", data: user)
  end
end
