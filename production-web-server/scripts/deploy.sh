#!/bin/bash

WEBSITE_DIR="../website"
WEB_ROOT="/var/www/html"
LOGFILE="../logs/deployment.log"

mkdir -p ../logs

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

echo "========================="
echo " WEBSITE DEPLOYMENT TOOL"
echo "========================="
echo

if [ ! -f "$WEBSITE_DIR/index.html" ]
then
    echo "Website file not found."

    echo "[$TIMESTAMP] DEPLOY FAILED: index.html missing" >> "$LOGFILE"

    exit 1
fi

sudo cp "$WEBSITE_DIR/index.html" "$WEB_ROOT/index.html"

sudo systemctl reload nginx

if curl -s localhost > /dev/null
then
    echo "Deployment successful."

    echo "[$TIMESTAMP] DEPLOY SUCCESS" >> "$LOGFILE"
else
    echo "Deployment failed."

    echo "[$TIMESTAMP] DEPLOY FAILED" >> "$LOGFILE"
fi
