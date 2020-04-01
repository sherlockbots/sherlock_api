defmodule SherlockApiWeb.Router do
  use SherlockApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SherlockApiWeb do
    pipe_through :api

    get "/restrict_word/:uuid", RestrictWordController, :show
    delete "/restrict_word/:uuid", RestrictWordController, :delete

    get "/:client_id/restrict_word", RestrictWordController, :all
    post "/:workspace_uuid/restrict_word", RestrictWordController, :create
  end
end
