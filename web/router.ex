defmodule Blabber.Router do
  use Blabber.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Blabber do
    pipe_through :api

    resources "session", SessionController, only: [:index]
  end
end
