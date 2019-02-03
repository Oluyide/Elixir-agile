defmodule Vueshatter.Repo.Migrations.AddBidHistory do
  use Ecto.Migration

  def change do
    create table(:bids) do
      #add :username, :string
      add :biddingTime, :utc_datetime
      add :item_id, :integer
      add :item_name, :string
      add :amount, :float
      timestamps()
  end
end
end


