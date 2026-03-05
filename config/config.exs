import Config

# Ecto repos and generator configuration
config :astrabox,
  ecto_repos: [Astrabox.Repo],
  generators: [timestamp_type: :utc_datetime]

# Endpoint configuration
config :astrabox, AstraboxWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: AstraboxWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Astrabox.PubSub

# Mailer (uses Local adapter in dev; override in runtime.exs for prod)
config :astrabox, Astrabox.Mailer, adapter: Swoosh.Adapters.Local

# Logger format
config :logger, :default_formatter,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON
config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
