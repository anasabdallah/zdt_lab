#!/bin/bash

echo "Creating Network Bridge .."
docker network create traefik_webgateway

echo "Starting the load balancer .."
docker-compose --project-name=traefik -f docker-compose.traefik.yml up -d
