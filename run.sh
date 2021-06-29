#!/bin/bash
. .env	
rm -rf _build
MIX_ENV=prod mix release production
./_build/prod/rel/production/bin/production eval "RuntimeEnvs.ReleaseTasks.migrate_and_seed"
./_build/prod/rel/production/bin/production start
