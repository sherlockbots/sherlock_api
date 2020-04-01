defmodule SherlockApiWeb.AccountView do
  use SherlockApiWeb, :view

  def render("index.json", %{accounts: accounts}) do
    render_many(accounts, SherlockApiWeb.AccountView, "single.json")
  end

  def render("single.json", %{account: account}) do
    %{
      uuid: account.uuid,
      email: account.email
    }
  end
end
