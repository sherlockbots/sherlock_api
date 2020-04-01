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

  def get_by_client_id(client_id) do
    query = from r in RestrictWord, join: w in Workspace, on: w.uuid == r.workspace_uuid, where: w.client_id == ^client_id, select: r
    Repo.all(query)
  end

  def get(uuid) do
    Repo.get(RestrictWord, uuid)
  end

  def save(workspace_uuid, params) do
    changeset(%RestrictWord{workspace_uuid: workspace_uuid}, params)
    |> Repo.insert
  end
end
