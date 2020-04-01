defmodule SherlockApiWeb.Router do
  use SherlockApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SherlockApiWeb do
    pipe_through :api
    get "/:uuid/restrict_word", RestrictWordController, :all
  end
end
