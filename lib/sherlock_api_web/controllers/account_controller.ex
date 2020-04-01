defmodule SherlockApiWeb.AccountController do
  use SherlockApiWeb, :controller

  alias SherlockApi.Domain.Account

  def all(conn, %{"client_id" => client_id}) do
    accounts = Account.get_by_client_id(client_id)
    render(conn, "index.json", accounts: accounts)
  end

  def create(conn, %{"workspace_uuid" => workspace_uuid} = param) do
    with {:ok, %Account{} = account} <- Account.save(workspace_uuid, param) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.account_path(conn, :show, account))
      |> render("show.json", account: account)
    end
  end

  def show(conn, %{"uuid" => uuid}) do
    account = Account.get(uuid)
    render(conn, "show.json", account: account)
  end

  def delete(conn, %{"uuid" => uuid}) do
    with {:ok, _} = Account.delete(uuid) do
      conn
      |> send_resp(:no_content, "")
    end
  end
end
