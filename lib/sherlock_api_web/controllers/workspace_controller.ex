defmodule SherlockApiWeb.WorkspaceController do
  use SherlockApiWeb, :controller

  alias SherlockApi.Domain.Workspace

  def get(conn, %{"uuid" => uuid}) do
    workspace = Workspace.get_by_uuid(uuid)
    render(conn, "show.json", workspace: workspace)
  end
end
