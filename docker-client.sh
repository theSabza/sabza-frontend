#!/bin/bash

set -e

DOCKER_IMAGE=$1
CONTAINER_NAME=$2
DOCKER_LOGIN=$3
DOCKER_PWD=$4

# Check for arguments
if [[ $# -lt 4 ]] ; then
        echo '[ERROR] You must supply a Docker image, container, login and password'
        exit 1
fi

# Check for running container & stop it before starting a new one
if [ $(sudo docker inspect -f '{{.State.Running}}' $CONTAINER_NAME) = "true" ]; then
        sudo docker stop $CONTAINER_NAME
fi

echo "Stopping previous Container: $CONTAINER_NAME"
sudo docker rm $CONTAINER_NAME

echo "Starting Docker image name: $DOCKER_IMAGE"

echo $DOCKER_PWD | sudo docker login -u $DOCKER_LOGIN --password-stdin

sudo docker run -d -p 3201:3201 --restart always --name $CONTAINER_NAME $DOCKER_IMAGE

sudo docker ps -a