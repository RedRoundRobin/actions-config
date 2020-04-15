#!/bin/sh

GREEN='\033[0;32m'
ORANGE='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "============================================="
echo "${ORANGE}[Mr. Wolf] ${NC} Avvio installazione ThiReMa ..."
if [ -d "thirema" ] 
then
	echo "${ORANGE}[Mr. Wolf] ${NC} Rimozione dei servizi attivi ..."
	docker-compose  \
	-f thirema/docker-compose.yml \
	-f thirema/docker-compose.thirema.yml \
	down -v
	docker image prune -f
	rm -rf ./thirema/
	echo "${ORANGE}[Mr. Wolf] ${GREEN} Rimozione eseguita!"
fi
echo "${ORANGE}[Mr. Wolf] ${NC} Scaricamento delle componenti software ..."
mkdir thirema
git clone https://github.com/RedRoundRobin/swe-kafka-db thirema/swe-kafka-db
git clone https://github.com/RedRoundRobin/swe-gateway thirema/swe-gateway
git clone https://github.com/RedRoundRobin/swe-api thirema/swe-api
git clone https://github.com/RedRoundRobin/swe-telegram thirema/swe-telegram
git clone https://github.com/RedRoundRobin/swe-webapp thirema/swe-webapp
echo "${ORANGE}[Mr. Wolf] ${GREEN} Componenti scaricate con successo!"
cp ./docker-compose.thirema.yml thirema/
mv ./thirema/swe-kafka-db/kafka/* thirema/
echo "${ORANGE}[Mr. Wolf] ${NC} Installazione e avvio dei container Docker in corso..."
docker-compose \
	-f thirema/docker-compose.yml \
	-f thirema/docker-compose.thirema.yml \
	up --build -d
echo "${ORANGE}[Mr. Wolf] ${GREEN} Avvio dei container completato!"
echo "${NC} ============================================="
echo "${NC}> ${ORANGE}Mr. Wolf ${GREEN} solved our ${RED} problems ${NC} <"