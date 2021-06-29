import Config

# Settings at runtime for demo apps
system_envs = System.get_env()
IO.inspect("#{system_envs["FOO"]}", label: "Runtime config foo value")
IO.inspect(Application.get_all_env(:runtime_envs), label: ":runtime_envs all env values")

IO.inspect("Setting runtime config...")

if System.get_env("DEPLOY_ENV", "") == "demo" do
  config :runtime_envs, foo: System.fetch_env!("FOO")
end

# IO.inspect(Application.get_all_env(:runtime_envs), label: ":runtime_envs all env values")
