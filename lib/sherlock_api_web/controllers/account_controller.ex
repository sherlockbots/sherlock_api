defmodule SherlockApiWeb.AccountController do
  use SherlockApiWeb, :controller

  alias SherlockApi.Domain.Account

  def all(conn, %{"client_id" => client_id}) do
    accounts = Account.get_by_client_id(client_id)
    render(conn, "index.json", accounts: accounts)
  end
end
