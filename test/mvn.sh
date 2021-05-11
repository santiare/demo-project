#!/bin/bash

echo "***************************"
echo "***** Testing Code ********"
echo "***************************"

WORKSPACE=/data/jenkins/jenkins_home/workspace/Demo-Pipeline

docker run --rm -v $PWD/java-app:/app -v /root/.m2/:/root/.m2 -w /app maven:ibmjava-alpine "$@"
