import Config

# Database configuration
config :astrabox, Astrabox.Repo,
  username: "root",
  password: "123456",
  hostname: "localhost",
  database: "demo",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# Endpoint configuration for development
config :astrabox, AstraboxWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "V0jxt3KUYHoW4pjQY0dV6aE5bZKhkMYzkDTxbezH83lS7CelMelYU1GEowKGm1EY",
  watchers: []

# Enable dev routes (mailbox preview)
config :astrabox, dev_routes: true

# Simplified log format in development
config :logger, :default_formatter, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime

# Disable Swoosh API client (only needed for production adapters)
config :swoosh, :api_client, false
