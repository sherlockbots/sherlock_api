defmodule SherlockApi.Domain.Account do
  use SherlockApi.Schema

  import Ecto.Changeset
  import Ecto.Query

  alias SherlockApi.Domain.Workspace
  alias SherlockApi.Domain.Account

  alias SherlockApi.Repo

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

  @spec get_by_client_id(any) :: any
  def get_by_client_id(client_id) do
    query =
      from a in Account,
        join: w in Workspace,
        on: w.uuid == a.workspace_uuid,
        where: w.client_id == ^client_id,
        select: a

    Repo.all(query)
  end
end
