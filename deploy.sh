#!/bin/bash

cd /home/ubuntu/devops-build/build

echo "Starting Docker containers"
docker-compose up -d

if [ $? -eq 0 ]; then
    echo "Docker containers started successfully"
else
    echo "Docker containers failed to start"
    exit 1
fi
