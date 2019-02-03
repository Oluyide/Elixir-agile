# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Vueshatter.Repo.insert!(%Vueshatter.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Vueshatter.Repo
alias Vueshatter.Persists


auctions = [
    %{
      descriptions: "Adenimi or444 le yi",
      price: 1110.22,
      closing_date: DateTime.utc_now(),
    },
    %{
      descriptions: "Adenimi ori le yi",
      price: 11110.22,
      closing_date: DateTime.utc_now(),
    },
    %{
      descriptions: "Adenimi ori le yi",
      price: 12340.22,
      closing_date: DateTime.utc_now(),
    },
    %{
      descriptions: "Adenimi ori le yi",
      prices: 120.22,
      closing_date: DateTime.utc_now(),
    }
  ]
Enum.each(auctions, fn(data) ->
  Persists.create_auctionItems(data)
  end)

