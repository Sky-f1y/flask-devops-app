#!/bin/bash

# URL of your Flask app
URL="http://127.0.0.1:5000"

# Get the HTTP status code
STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)

# Append log to health.log based on result
if [ $STATUS -eq 200 ]; then
    echo "$(date): App is running" >> health.log
else
    echo "$(date): App is NOT running - status code $STATUS" >> health.log
fi
