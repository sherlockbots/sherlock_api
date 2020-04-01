defmodule SherlockApi.Domain.RestrictWord do
  use SherlockApi.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias SherlockApi.Domain.Workspace
  alias SherlockApi.Domain.RestrictWord
  alias SherlockApi.Repo

  schema "restrict_words" do
    field :word, :string
    belongs_to(
      :workspace,
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

  def get_by_client_id(uuid) do
    query = from r in RestrictWord, where: r.workspace_uuid == ^uuid
    Repo.all(query)
  end
end
