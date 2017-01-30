defmodule SoftwareAgency.PageController do
  use SoftwareAgency.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
