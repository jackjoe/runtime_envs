# RuntimeEnvs

Small product for an issue on elixirforum.

## Setup

- clone repo
- run

```bash
make run
```

## Result

```bash
$ Runtime config FOO value: "RUNTIME"
$ :runtime_envs all env values: []
$ "Setting runtime config..."
$ :runtime_envs all env values BIS: [foo: "RUNTIME", env: :prod]
```

Why do we get an empty list for `Application.get_all_env/1`?

## Expected result

The `foo` config setting should have the value of the exported env variable, but it does not. It is read from the env variable, but when calling `Application.get_all_env` the compiled value is returned.

```bash
$ Runtime config FOO value: "RUNTIME"
$ :runtime_envs all env values: [foo: "COMPILE", env: :prod]
$ "Setting runtime config..."
$ :runtime_envs all env values BIS: [foo: "RUNTIME", env: :prod]
```
