#!/bin/bash
cd /var/app
echo stopping mix server
ps aux | grep 'mix phx.server' | grep -v grep | awk '{print $2}' | xargs kill
echo stopping docker compose containers
docker-compose -f ./docker-compose/microservices.yml down
