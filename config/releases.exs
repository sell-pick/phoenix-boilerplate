import Config

# Configures the endpoint
config :test, TestWeb.Endpoint,
  server: true,
  url: [host: ""],
  http: [
      :inet,
      port: System.get_env("PORT"),
  ],
  secret_key_base: "3IlSPH0aNK2CFCOty+Oa6o6V4GeZCkwYypkCdHT5B13ve3ccsJhwxaCjfJ3+GaPz",
  render_errors: [view: TestWeb.ErrorView, accepts: ~w(json)]

# Do not print debug messages in production
config :logger, level: :info

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
