defmodule SherlockApi.Repo do
  use Ecto.Repo,
    otp_app: :sherlock_api,
    adapter: Ecto.Adapters.Postgres
end
