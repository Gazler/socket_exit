# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :socket_exit, SocketExitWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Pn6L3TZTBt3yiHVNySI80bMiD7hW5vi3dAQ5TE5mEo/2STS8uDN7CpBw8AiBMgaC",
  render_errors: [view: SocketExitWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SocketExit.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
