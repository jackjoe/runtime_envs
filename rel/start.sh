#!/bin/bash

./bin/production eval "RuntimeEnvs.ReleaseTasks.migrate_and_seed"

./bin/production start
