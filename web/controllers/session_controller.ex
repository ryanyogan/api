defmodule Slacker.SessionController do
  use Slacker.Web, :controller

  def index(conn, _params) do
    conn
    |> json(%{status: "OK"})
  end
end
