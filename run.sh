#!/bin/bash
. .env
rm -rf _build
export MIX_ENV=prod
export FOO=COMPILE
mix release production
export FOO=RUNTIME
export DEPLOY_ENV=demo
./_build/prod/rel/production/bin/production eval "RuntimeEnvs.ReleaseTasks.migrate_and_seed"
./_build/prod/rel/production/bin/production start
