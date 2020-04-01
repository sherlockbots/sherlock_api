defmodule SherlockApi.Domain.Workspace do
  use SherlockApi.Schema
  import Ecto.Changeset

  alias SherlockApi.Domain.Workspace
  alias SherlockApi.Domain.Account
  alias SherlockApi.Domain.RestrictWord
  alias SherlockApi.Repo

  schema "workspaces" do
    field :client_id, :string
    field :client_type, :string
    field :message_filter, :boolean
    field :code_filter, :boolean
    field :pdf_filter, :boolean
    field :docs_filter, :boolean
    field :image_filter, :boolean
    has_many(:accounts, Account)
    has_many(:restrict_words, RestrictWord)
  end

  @doc """
  changeset request to Settings
  ## Example
      iex> request = %{ "client_id" => "23412431", "client_type" => "slack", "code_filter"=> true, "pdf_filter"=> true, "docs_filter"=> true, "image_filter"=> true, "message_filter"=> true, "woman_protect"=> true, "accounts" => [%{"email"=> "test@email.com"}], "restrict_words"=> [%{"word"=> "leco"}] }
      iex> SherlockApi.Domain.Workspace.changeset(%SherlockApi.Domain.Workspace{}, request)
  """
  def changeset(struct, params) do
    struct
    |> cast(params, [
      :client_id,
      :client_type,
      :message_filter,
      :code_filter,
      :pdf_filter,
      :docs_filter,
      :image_filter
    ])
    |> cast_assoc(:accounts)
    |> cast_assoc(:restrict_words)
    |> validate_required([:client_id])
  end

  def save(params) do
    changeset(%Workspace{}, params)
    |> Repo.insert
  end
end
