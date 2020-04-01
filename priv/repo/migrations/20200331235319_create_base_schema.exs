defmodule SherlockApi.Repo.Migrations.CreateBaseSchema do
  use Ecto.Migration

  def change do
    create table(:workspaces, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      add :client_type, :string
      add :client_id, :string
      add :message_filter, :boolean
      add :code_filter, :boolean
      add :pdf_filter, :boolean
      add :docs_filter, :boolean
      add :image_filter, :boolean
    end

    create table(:restrict_words, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      add :workspace_uuid, references(:workspaces, type: :uuid, column: :uuid)
      add :word, :string
    end

    create table(:accounts, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      add :workspace_uuid, references(:workspaces, type: :uuid, column: :uuid)
      add :email, :string
    end
  end
end
