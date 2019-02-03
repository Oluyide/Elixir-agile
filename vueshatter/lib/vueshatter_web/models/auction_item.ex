defmodule Vueshatter.Models.AuctionItem do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Poison.Encoder, only: [:id, :descriptions, :price, :closing_date]}
  schema "auction_items" do
      field :descriptions, :string
      field :price, :float
      field :closing_date, :utc_datetime
      timestamps()
  end


   @doc false
   def changeset(auction, attrs) do
    auction
    |> cast(attrs, [:descriptions, :price, :closing_date])
    |> validate_required([:descriptions, :price, :closing_date])
  end
end


