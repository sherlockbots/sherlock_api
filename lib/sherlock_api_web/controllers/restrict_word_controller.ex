defmodule SherlockApiWeb.RestrictWordController do
  use SherlockApiWeb, :controller

  alias SherlockApi.Domain.RestrictWord

  def all(conn, %{"client_id" => client_id}) do
    restrict_words = RestrictWord.get_by_client_id(client_id)
    render(conn, "index.json", restrict_words: restrict_words)
  end

  def create(conn, %{"workspace_uuid" => workspace_uuid} = param) do
    with {:ok, %RestrictWord{} = restrict_word} <- RestrictWord.save(workspace_uuid, param) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.restrict_word_path(conn, :show, restrict_word))
      |> render("show.json", restrict_word: restrict_word)
    end
  end

  def show(conn, %{"uuid" => uuid}) do
    restrict_word = RestrictWord.get(uuid)
    render(conn, "show.json", restrict_word: restrict_word)
  end
end
