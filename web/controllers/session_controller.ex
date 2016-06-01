defmodule Blabber.SessionController do
  use Blabber.Web, :controller

  def index(conn, _params) do
    conn
    |> json(%{status: "OK"})
  end
end
