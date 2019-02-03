defmodule VueshatterWeb.AuctionController do
  use VueshatterWeb, :controller
  alias Vueshatter.{Repo, Models.AuctionItem, Persists, Models.Bids}
  # alias Ecto.{Changeset}

  # alias Vueshatter.Models.AuctionItem

  def index(conn, _params) do
    auctions = Repo.all(AuctionItem)
    |>Enum.map(fn auction -> %{id: auction.id,
                               descriptions: auction.descriptions,
                               price: auction.price,
                               closing_date: auction.closing_date} end)
    conn
        |> put_status(:ok)
        |> json(auctions)
    #render conn, "index.html", auctions: auctions
    # with {:ok, %AuctionItem{} = auctions} <- Persists.list_auction_items do

    #   render(conn, "index.html", auctions: auctions)
    # end
  end

  def show(conn, %{"id" => id}) do
   auction =  Repo.get(AuctionItem, id)
   conn
        |> put_status(:ok)
        |> json(auction)
  end

  def create_bid(conn,  %{"bid" => params}) do
    auction =  Repo.get(AuctionItem, params["item_id"])
     {val, _} = Float.parse(params["amount"])
    case auction.price > val do
    false ->
      _bid =  Persists.create_bids(params)
      conn
      |> put_flash(:info, "created")
      |> render("show.html",auction: auction)
    true ->
      conn
      |> put_flash(:error, "never")
      |> render("show.html",auction: auction)
    end
  end

  def get_bids_history(conn,  %{"item_id" => item_id}) do

    bids = Persists.get_bids!(item_id)|>Repo.all

    IO.puts("======")
    IO.inspect(bids)
    IO.puts("======")
    conn
        |> put_status(:ok)
        |> json(bids)
  end
end


