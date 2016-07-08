defmodule Slacker.Router do
  use Slacker.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Slacker do
    pipe_through :api

    resources "session", SessionController, only: [:index]
  end
end
