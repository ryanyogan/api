defmodule Blabber.Router do
  use Blabber.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  pipeline :api_auth do
    plug :accepts, ["json", "json-api"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/api", Blabber do
    pipe_through :api

    # Registration
    post "register", RegistrationController, :create

    # Login
    post "token", SessionController, :create, as: :login
  end

  scope "/api", Blabber do
    pipe_through :api_auth

    get "/user/current", UserController, :current
    resources "users", UserController, only: [:show, :index] do
      get "rooms", RoomController, :index, as: :rooms
    end
    resources "rooms", RoomController, except: [:new, :edit]
  end
end
