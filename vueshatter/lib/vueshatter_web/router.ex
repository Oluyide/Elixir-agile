defmodule VueshatterWeb.Router do
  use VueshatterWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", VueshatterWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    # get "/", AuctionController, :index
    #get "/item/:id", AuctionController, :show
    # post  "/bids", AuctionController, :create_bid

    #resources "/item", AuctionController
  end

  # Other scopes may use custom stacks.
  scope "/api", VueshatterWeb do
    pipe_through :api

    get "/bid_history", AuctionController, :get_bids_history
    get "/auction", AuctionController, :index
    get "/item/:id", AuctionController, :show
    post  "/bids", AuctionController, :create_bid
  end
end
