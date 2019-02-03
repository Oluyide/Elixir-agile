defmodule Vueshatter.Repo.Migrations.MyBooks do
  use Ecto.Migration

  def change do

    create table(:books) do
      add :call_no, :string
      add :title, :string
      add :author, :string
      timestamps()

  end
end
