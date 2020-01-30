#!/bin/sh
if [ $(docker ps -f name=blue -q) ]
then
    ENV="green"
    OLD="blue"
else
    ENV="blue"
    OLD="green"
fi

echo "Pulling the latest version .."
docker pull anasabdullah/zdt-app:latest

echo "Starting "$ENV" container"
docker-compose --project-name=$ENV up --force-recreate

echo "Waiting..."
sleep 5s

echo "Stopping "$OLD" container"
docker-compose --project-name=$OLD down
