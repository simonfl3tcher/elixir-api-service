use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :climb_trainer, ClimbTrainerWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :climb_trainer, ClimbTrainer.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "climb_trainer_test",
  hostname: "postgres",
  pool: Ecto.Adapters.SQL.Sandbox
