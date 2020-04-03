defmodule SherlockApiWeb.WorkspaceView do
  use SherlockApiWeb, :view

  def render("single.json", %{workspace: workspace}) do
    %{
      uuid: workspace.uuid,
      client_type: workspace.client_type,
      message_filter: workspace.message_filter,
      code_filter: workspace.code_filter,
      pdf_filter: workspace.pdf_filter,
      docs_filter: workspace.docs_filter,
      image_filter: workspace.image_filter,
      accounts:
        Enum.map(workspace.accounts, fn a ->
          %{
            uuid: a.uuid,
            email: a.email
          }
        end),
      restrict_words:
        Enum.map(workspace.restrict_words, fn r ->
          %{
            uuid: r.uuid,
            word: r.word
          }
        end)
    }
  end

  def render("show.json", %{workspace: workspace}) do
    render_one(workspace, SherlockApiWeb.WorkspaceView, "single.json")
  end
end
