defmodule SherlockApiWeb.Router do
  use SherlockApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SherlockApiWeb do
    pipe_through :api

    # restrict words controller

    get "/restrict_word/:uuid", RestrictWordController, :show
    delete "/restrict_word/:uuid", RestrictWordController, :delete

    get "/:client_id/restrict_word", RestrictWordController, :all
    post "/:workspace_uuid/restrict_word", RestrictWordController, :create

    # account controller

    get "/account/:uuid", AccountController, :show
    get "/:client_id/account", AccountController, :all

    delete "/account/:uuid", AccountController, :delete
    post "/:workspace_uuid/account", AccountController, :create
  end
end
