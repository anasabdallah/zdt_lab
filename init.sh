#!/bin/bash

echo "Starting the load balancer .."
docker-compose --project-name=traefik -f docker-compose.traefik.yml up -d