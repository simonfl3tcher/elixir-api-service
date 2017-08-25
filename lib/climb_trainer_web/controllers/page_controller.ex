defmodule ClimbTrainerWeb.PageController do
  use ClimbTrainerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
