defmodule SherlockApi.Domain.RestrictWord do
  use SherlockApi.Schema
  import Ecto.Changeset

  alias SherlockApi.Domain.Workspace

  schema "restrict_words" do
    field :word, :string
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
    |> cast(params, [:word])
    |> validate_required([:word])
    |> foreign_key_constraint(:workspace_uuid)
  end
end
