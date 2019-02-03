defmodule Vueshatter.Repo.Migrations.AddAcuctionDetails do
  use Ecto.Migration

  def change do
    create table(:auction_items) do
      add :descriptions, :string
      add :price, :float
      add :closing_date, :utc_datetime
      timestamps()
  end
end
end
