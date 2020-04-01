defmodule SherlockApiWeb.RestrictWordController do
  use SherlockApiWeb, :controller

  alias SherlockApi.Domain.RestrictWord

  def all(conn, %{"uuid" => client_id}) do
    restrict_words = RestrictWord.get_by_client_id(client_id)
    render(conn, "index.json", restrict_words: restrict_words)
  end
end
