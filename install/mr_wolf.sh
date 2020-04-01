#!/bin/sh
echo "> You read the bible, Brett? Let's see..."
if [ -d "thirema" ] 
then
	docker-compose down -v -f \
	-f thirema/docker-compose.thirema.yml \
	-f thirema/swe-kafka-db/kafka/docker-compose.thirema.yml
	rm -rf thirema/
fi
mkdir thirema
git clone https://github.com/RedRoundRobin/swe-kafka-db thirema/
git clone https://github.com/RedRoundRobin/swe-gateway thirema/
git clone https://github.com/RedRoundRobin/swe-api thirema/
git clone https://github.com/RedRoundRobin/swe-telegram thirema/
git clone https://github.com/RedRoundRobin/swe-webapp thirema/
echo "> Have you ever given a foot massage? Stay calm and relax ..."
cp docker-compose.thirema.yml thirema/
docker-compose up --build -d \
	-f thirema/docker-compose.thirema.yml \
	-f thirema/swe-kafka-db/kafka/docker-compose.thirema.yml
echo "> Mr. wolf solved our problems."