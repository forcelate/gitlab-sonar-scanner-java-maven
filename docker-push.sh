#!/usr/bin/env bash

echo "========================="
echo "Docker push: started..."
echo "========================="

echo "Docker build image"
docker build -t tech1/gitlab-sonar-scanner-java-maven:latest .

echo "Docker tag image"
docker tag tech1/gitlab-sonar-scanner-java-maven:latest tech1/gitlab-sonar-scanner-java-maven:latest

echo "Docker push image"
docker push tech1/gitlab-sonar-scanner-java-maven:latest

echo "========================="
echo "Docker push: completed..."
echo "========================="
