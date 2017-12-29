#!/bin/bash

echo "=================> STARTING TEST"
echo "=================> SETUP TEST ENVIRONMENT"
set -ev

echo "========> BUILDING APPLICATION Container (dev)"
sudo docker-compose build

echo "========> STARTING APPLICATION Container (dev)"
sudo docker-compose up

echo "========> END TESTING APPLICATIONS"
exit 0;