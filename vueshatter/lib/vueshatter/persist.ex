defmodule Vueshatter.Persists do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Vueshatter.Repo

  alias Vueshatter.Models.AuctionItem
  alias Vueshatter.Models.Bids

  def create_auctionItems(attrs \\ %{}) do
    %AuctionItem{}
    |> AuctionItem.changeset(attrs)
    |> Repo.insert()
  end

  def create_bids(attrs \\ %{}) do
    %Bids{}
    |> Bids.changeset(attrs)
    |> Repo.insert()
  end

  def list_auction_items do
    Repo.all(AuctionItem)
  end


  def get_auction!(id), do: Repo.get!(AuctionItem, id)

  #def get_bids!(item_id), do: Repo.get!(Bids, item_id: item_id)

  def get_bids!(driver_id) do
    #from(driver_loc in query, where: driver_loc.status == "Invisible", order_by: fragment("? <-> ST_SetSRID(ST_MakePoint(?,?), ?)", driver_loc.driver_lat_long, ^lng, ^lat, ^srid))
    from orders in Bids, where: orders.item_id == ^driver_id, select: orders
   end
end
