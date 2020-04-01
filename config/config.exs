# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sherlock_api,
  ecto_repos: [SherlockApi.Repo]

# Configures the endpoint
config :sherlock_api, SherlockApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WSE+mTMbg39D3gPIx3u2yjMf01vBGYgDG3yUk0F4Do4mgNOrC4/ojH1HffmAshDk",
  render_errors: [view: SherlockApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: SherlockApi.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "NxdEifms"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :sherlock_api, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
      # phoenix routes will be converted to swagger paths
      router: SherlockApiWeb.Router,
      # (optional) endpoint config used to set host, port and https schemes.
      endpoint: SherlockApiWeb.Endpoint
    ]
  }

config :phoenix_swagger, json_library: Jason

config :sherlock_api, SherlockApiWeb.End, url: [host: "localhost"]
