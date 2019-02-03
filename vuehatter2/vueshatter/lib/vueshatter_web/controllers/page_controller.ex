defmodule VueshatterWeb.PageController do
  use VueshatterWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
