# RuntimeEnvs

Small product for an issue on elixirforum.

## Setup

- clone repo
- run 

```bash
MIX_ENV=prod mix release production && FOO="RUNTIME_FOO" _build/prod/rel/production/bin/production start
```

## Expected result

The `foo` config setting should have the value of the exported env variable, but it does not. It is read from the env variable, but when calling `Application.get_all_env` the compiled value is returned.

```bash
$ Runtime config foo value: "RUNTIME_FOO"
$ :runtime_envs all env values: [foo: "COMPILE_TIME_FOO", env: :prod]
$ "Setting runtime config..."
$ :runtime_envs all env values BIS: [foo: "COMPILE_TIME_FOO", env: :prod]
```
