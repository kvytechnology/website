defmodule SoftwareAgency.PageController do
  use SoftwareAgency.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def about(conn, _params) do
    render conn, "about.html"
  end

  def services(conn, _params) do
    render conn, "services.html"
  end

  def contact(conn, _params) do
    render conn, "contact.html"
  end

  def inquery(conn, %{"inquery" => sender_info }) do
    IO.inspect sender_info
    SoftwareAgency.Emails.inquery(sender_info) |> SoftwareAgency.Mailer.deliver_now
    render(conn, "index.html")
    conn
    |> put_flash(:info, "Thank you.")
    |> redirect(to: page_path(conn, :index))
  end
end
