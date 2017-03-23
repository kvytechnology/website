defmodule SoftwareAgency.Router do
  use SoftwareAgency.Web, :router

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

  scope "/", SoftwareAgency do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/services", PageController, :services
    get "/contact", PageController, :contact
    post "/inquery", PageController, :inquery
  end

  # Other scopes may use custom stacks.
  # scope "/api", SoftwareAgency do
  #   pipe_through :api
  # end
end
