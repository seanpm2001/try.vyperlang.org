#!/usr/bin/env bash
# do a full rebuild and hard restart docker compose

# load the environment variables
set -o allexport; source .env; set +o allexport;

set -Eeuxo pipefail

# if this is a branch, we need to discard cache
docker compose build --no-cache

docker compose down

docker compose up --force-recreate --detach
