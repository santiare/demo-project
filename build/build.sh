#!/bin/bash

# Copy the new jar to the build location
echo $PWD
cp -f java-app/target/*.jar build/

echo "*****************************"
echo "*** Building Docker Image ***"
echo "*****************************"

cd build/ && docker-compose -f docker-compose-build.yml build --no-cache
