defmodule SocketExitWeb.PageController do
  use SocketExitWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
