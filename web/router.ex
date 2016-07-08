defmodule Slacker.Router do
  use Slacker.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Slacker do
    pipe_through :api
  end
end
