#!/bin/bash
# Run docker compose
cd /var/app
echo starting docker compose microservices
docker-compose -f ./docker-compose/microservices.yml up -d
echo starting server
mix local.hex --force
mix phx.server
