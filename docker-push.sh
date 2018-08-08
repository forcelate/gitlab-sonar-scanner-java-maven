#!/usr/bin/env bash

echo "========================="
echo "Docker push: started..."
echo "========================="

echo "Docker build image"
docker build -t forcelate/gitlab-sonar-scanner-java-maven:latest .

echo "Docker tag image"
docker tag forcelate/gitlab-sonar-scanner-java-maven:latest forcelate/gitlab-sonar-scanner-java-maven:latest

echo "Docker push image"
docker push forcelate/gitlab-sonar-scanner-java-maven:latest

echo "========================="
echo "Docker push: completed..."
echo "========================="
