# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :runtime_envs,
  env: Mix.env(),
  foo: System.get_env("FOO", "FOO_EMBED")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# import_config "#{Mix.env()}.exs"
