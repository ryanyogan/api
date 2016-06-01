defmodule Blabber.AuthErrorHandler do
  use Blabber.Web, :controller

  def unauthenticated(conn, params) do
    conn
    |> put_status(401)
    |> render(Blabber.ErrorView, "401.json")
  end

  def unauthorized(conn, params) do
    conn
    |> put_status(403)
    |> render(Blabber.ErrorView, "403.json")
  end
end
