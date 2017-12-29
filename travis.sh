#!/bin/bash

echo "=================> STARTING TEST"
echo "=================> SETUP TEST ENVIRONMENT"
set -ev

echo "========> BUILDING APPLICATION Container (dev)"
sudo docker-compose -f travis-compose.yml build

echo "========> STARTING APPLICATION Container (dev)"
sudo docker-compose -f travis-compose.yml up -d app
sudo docker-compose -f travis-compose.yml logs --tail=200

echo "========> TESTING APPLICATIONS"
curl -I http://localhost:8081 && echo ""

echo "========> END TESTING APPLICATIONS"
exit 0;