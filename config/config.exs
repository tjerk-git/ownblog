# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :vantjerk,
  ecto_repos: [Vantjerk.Repo]

# Configures the endpoint
config :vantjerk, VantjerkWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wgaW1uxDa8WXS7IijfVaDjNDIRFmv3GIwmUlnc1p651AfFL+24fN3t5mrLL9KRf8",
  render_errors: [view: VantjerkWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Vantjerk.PubSub,
  live_view: [signing_salt: "YApMAjUJ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
