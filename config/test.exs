use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :twitter_poll, TwitterPollWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :twitter_poll, TwitterPoll.Repo,
  username: "postgres",
  password: "postgres",
  database: "twitter_poll_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
