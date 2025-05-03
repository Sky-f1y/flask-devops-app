#!/bin/bash

echo "Deploying app..."

# Creating Green deployment folder -- if doesn't exist
mkdir -p /tmp/green

# Copy latest app version
cp app.py /tmp/green/

# Simulate switching traffic to green
ln -sfn /tmp/green /tmp/current

echo "Deployed to /tmp/green and linked to /tmp/current"


