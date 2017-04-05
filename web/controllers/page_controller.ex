defmodule Triary.PageController do
  use Triary.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
