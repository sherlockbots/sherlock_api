defmodule SherlockApiWeb.Router do
  use SherlockApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SherlockApiWeb do
    pipe_through :api
    get "/:client_id/restrict_word", RestrictWordController, :all
    get "/restrict_word/:uuid", RestrictWordController, :show

    post "/:workspace_uuid/restrict_word", RestrictWordController, :create
  end
end
