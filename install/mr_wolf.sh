#!/bin/sh
echo "> You read the bible, Brett? Let's see..."
if [ -d "thirema" ] 
then
	docker-compose  \
	-f thirema/docker-compose.yml \
	-f thirema/docker-compose.thirema.yml \
	down -v
	rm -rf ./thirema/
fi
mkdir thirema
git clone https://github.com/RedRoundRobin/swe-kafka-db thirema/swe-kafka-db
git clone https://github.com/RedRoundRobin/swe-gateway thirema/swe-gateway
git clone https://github.com/RedRoundRobin/swe-api thirema/swe-api
git clone https://github.com/RedRoundRobin/swe-telegram thirema/swe-telegram
git clone https://github.com/RedRoundRobin/swe-webapp thirema/swe-webapp
echo "> Have you ever given a foot massage? Stay calm and relax ..."
cp ./docker-compose.thirema.yml thirema/
mv ./thirema/swe-kafka-db/kafka/* thirema/
docker-compose \
	-f thirema/docker-compose.yml \
	-f thirema/docker-compose.thirema.yml \
	up --build -d
echo "> Mr. wolf solved our problems."