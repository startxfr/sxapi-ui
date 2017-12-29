#!/bin/bash

echo "=================> STARTING TEST"
echo "=================> SETUP TEST ENVIRONMENT"
set -ev

echo "========> BUILDING APPLICATION Container (dev)"
sudo docker-compose build

echo "========> STARTING APPLICATION Container (dev)"
sudo docker-compose up -d app
sudo docker-compose logs --tail=200

echo "========> TESTING APPLICATIONS"
curl -I http://localhost:1981 && echo ""

echo "========> END TESTING APPLICATIONS"
exit 0;