#!/bin/bash

docker-compose -f docker-compose-build.yaml build

docker tag udagram-reverseproxy "${DOCKER_USERNAME}/udagram-reverseproxy:v2b"
docker tag udagram-api-user "${DOCKER_USERNAME}/udagram-api-user:v2b"
docker tag udagram-api-feed "${DOCKER_USERNAME}/udagram-api-feed:v2b"
docker tag udagram-frontend:local "${DOCKER_USERNAME}/udagram-frontend:v2b"

echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

docker push "${DOCKER_USERNAME}/udagram-reverseproxy:v2b" &
docker push "${DOCKER_USERNAME}/udagram-api-user:v2b" &
docker push "${DOCKER_USERNAME}/udagram-api-feed:v2b" &
docker push "${DOCKER_USERNAME}/udagram-frontend:v2b" &
wait