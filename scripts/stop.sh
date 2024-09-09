#!/bin/bash

# Change directory to the application folder
cd /var/app || { echo "Directory /var/app not found"; exit 1; }

# Stop the Phoenix server
echo "Stopping Phoenix server..."
ps aux | grep 'mix phx.server' | grep -v grep | awk '{print $2}' | xargs kill || echo "No Phoenix server running, skipped."

# Stop Docker Compose containers
echo "Stopping Docker Compose containers..."
docker-compose -f ./docker-compose/microservices.yml down || echo "Docker Compose not running, skipped."

