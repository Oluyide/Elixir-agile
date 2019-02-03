defmodule Vueshatter.Repo.Migrations.Loanhistory do
  use Ecto.Migration

  def change do
    create table(:loansHistory) do
    add :start_date, :string
    add :return_date, :string
    add :cost, :string
    add :status, :string
    add :user_id, references(:users)
    add :book_id, references(:books)
    timestamps()
  end
end
end
