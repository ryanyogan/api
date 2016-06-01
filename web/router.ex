defmodule Blabber.Router do
  use Blabber.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Blabber do
    pipe_through :api
  end
end
