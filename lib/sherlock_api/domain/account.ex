defmodule SherlockApi.Domain.Account do
  use SherlockApi.Schema

  import Ecto.Changeset
  alias SherlockApi.Domain.Workspace

  schema "accounts" do
    field :email, :string

    belongs_to(
      :settings,
      Workspace,
      foreign_key: :workspace_uuid,
      references: :uuid,
      primary_key: true
    )
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:email])
    |> validate_required([:email])
    |> foreign_key_constraint(:workspace_uuid)
  end
end
