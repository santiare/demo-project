#!/bin/bash

echo "*********************"
echo "*** Pushing image ***"
echo "*********************"

IMAGE="demo-project"

echo "*** Logging in ***"
docker login -u $nxUser -p $nxUser 10.245.64.11:8083

echo "*** Tagging image ***"
docker tag $IMAGE:latest $nxHost:8083/$IMAGE:latest

echo "*** Pushing latest image ***"
echo "* Pushing image $nxHost:8083/$IMAGE:latest *"
docker push $nxHost:8083/$IMAGE:latest
