# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :software_agency,
  ecto_repos: [SoftwareAgency.Repo]

# Configures the endpoint
config :software_agency, SoftwareAgency.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "f7oJN4pOA74paNQxyVjTefJ7HdRdZKHnDC0CGlnOBxCOeWo4WC0Howsi67D8U860",
  render_errors: [view: SoftwareAgency.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SoftwareAgency.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :software_agency, SoftwareAgency.Mailer,
 adapter: Bamboo.SendgridAdapter,
 api_key: System.get_env("SENDGRID_API_KEY")

config :bugsnag, api_key: System.get_env("BUGSNAG_API_KEY")

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
