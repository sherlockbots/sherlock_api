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

  scope "/api/swagger" do
    forward "/", PhoenixSwagger.Plug.SwaggerUI, otp_app: :sherlock_api, swagger_file: "swagger.json"
  end

  def swagger_info do
    %{
      basePath: "/api",
      info: %{
        version: "1.0",
        title: "Sherlock Api"
      },
      tags: [
        %{
          name: "Account",
          description: "Manager account administrators"
        },
        %{
          name: "Restrict Word",
          description: "Manager words that you need blocked"
        }
      ]
    }
  end
end
