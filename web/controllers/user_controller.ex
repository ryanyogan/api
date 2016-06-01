defmodule Blabber.UserController do
  use Blabber.Web, :controller

  alias Blabber.User
  plug Guardian.Plug.EnsureAuthenticated, handler: Blabber.AuthErrorHandler

  def current(conn, _params) do
    user = conn
    |> Guardian.Plug.current_resource

    conn
    |> render(Blabber.UserView, "show.json", user: user)
  end
end
