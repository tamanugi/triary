# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :triary,
  ecto_repos: [Triary.Repo]

# Configures the endpoint
config :triary, Triary.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nvsSgNMiEYbcbtt6kuTeE3dVCbN3RYw/YHAwmb55I5SIVrfNiV3H5GItMwj7W06t",
  render_errors: [view: Triary.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Triary.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :triary,
  linebot_token: "4kjREOL5N9peafyT500jxUkP0Fre3/JSfJQTp0SUoJs/nzjJrQnCtq0nUaziFyk46bKkhawGLCbhDKU4WQeabFLf14tPLfkNZtwNeE2uCHd8ig1s7sCnHBU2Sra20OWfeUNursQdER7xe0HcrAzbvAdB04t89/1O/w1cDnyilFU="

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
