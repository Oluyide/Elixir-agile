defmodule Vueshatter.Models.Bids do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Poison.Encoder, only: [:biddingTime, :item_id, :item_name, :amount, :item_price]}
  schema "bids" do

      #field :username, :string
      field :biddingTime, :utc_datetime
      field :item_id, :integer
      field :item_name, :string
      field :amount, :float
      field :item_price, :float , virtual: true

      timestamps()
  end


   @doc false
   def changeset(bid, attrs \\ %{}) do
    bid
    |> cast(attrs, [:biddingTime, :item_id, :item_name, :amount,:item_price])
    |> validate_required([:biddingTime, :item_id, :item_name, :amount ,:item_price])
  end
end
