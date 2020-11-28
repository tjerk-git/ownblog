defmodule VantjerkWeb.PageController do
  use VantjerkWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
