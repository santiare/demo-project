#!/bin/bash

echo "*********************"
echo "*** Pushing image ***"
echo "*********************"

IMAGE="demo-project"

echo "*** Logging in ***"
docker login -u admin -p t2xm4nl1nux 10.245.64.11:8083

echo "*** Tagging image ***"
docker tag $IMAGE:latest 10.245.64.11:8083/$IMAGE:latest

echo "*** Pushing latest image ***"
echo "* Pushing image 10.245.64.11:8083/$IMAGE:latest *"
docker push 10.245.64.11:8083/$IMAGE:latest
