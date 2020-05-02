#!/bin/sh

#  Copyright 2020
#      ___         __  ___                    __  ___       __   _    
#    / _ \___ ___/ / / _ \___  __ _____  ___/ / / _ \___  / /  (_)__ 
#   / , _/ -_) _  / / , _/ _ \/ // / _ \/ _  / / , _/ _ \/ _ \/ / _ \
#  /_/|_|\__/\_,_/ /_/|_|\___/\_,_/_//_/\_,_/ /_/|_|\___/_.__/_/_//_/
#  
#  mr_wolf.sh - i solve problems for RIoT (Project ThiReMa)
#

GREEN='\033[0;32m'
ORANGE='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

dockercompose_up () {
    echo "${ORANGE}[Mr. Wolf] ${NC} Installazione e avvio dei container Docker in corso..."
    docker-compose \
        -f riot/docker-compose.yml \
        -f riot/docker-compose.thirema.yml \
        up --build -d
    echo "${ORANGE}[Mr. Wolf] ${GREEN} Avvio dei container completato!"
}

dockercompose_down () {
    echo "${ORANGE}[Mr. Wolf] ${NC} Rimozione dei servizi attivi ..."
    docker-compose  \
        -f riot/docker-compose.yml \
        -f riot/docker-compose.thirema.yml \
        down -v
    echo "${ORANGE}[Mr. Wolf] ${GREEN} Rimozione eseguita!"
}


if [ $# = 0 ] || [ $1 = "help" ]
then
    echo "I'm Mr Wolf. Tell me what the problem is.. "
    echo "[USAGE:] ${ORANGE}mr_wolf.sh ${NC}[command]"
    echo " ${NC}"
    echo "${NC}help      ${NC}Comandi di aiuto per lo script"
    echo "${GREEN}init      ${NC}Prima installazione e avvio di tutti i servizi RIoT"
    echo "${GREEN}start     ${NC}Avvio di tutti i servizi RIoT"
    echo "${ORANGE}stop      ${NC}Stop di tutti i servizi RIoT"
    echo "${RED}remove    ${NC}Stop e rimozione di tutti i servizi RIoT"
    echo "${RED}autodevmode       ${RED}[NOT FOR PRODUCTION] ${NC}Auto re-installazione automatica delle componenti in remoto dai branch develop"
fi

if [ $1 = "init" ]
    echo "${ORANGE}[Mr. Wolf] ${NC} Copia delle componenti software ..."
    mkdir riot
    cp kafka-db riot/kafka-db
    cp gateway riot/gateway
    cp api riot/api
    cp telegram riot/telegram
    cp webapp riot/webapp
    echo "${ORANGE}[Mr. Wolf] ${GREEN} Componenti copiate con successo!"
    cp ./docker-compose.riot.yml thirema/
    mv ./thirema/swe-kafka-db/kafka/* thirema/
    echo "${ORANGE}[Mr. Wolf] ${NC} Installazione e avvio dei container Docker in corso..."
    docker-compose \
        -f thirema/docker-compose.yml \
        -f thirema/docker-compose.thirema.yml \
        up --build -d
    echo "${ORANGE}[Mr. Wolf] ${GREEN} Avvio dei container completato!"
    echo "${NC} ============================================="
    echo "${NC}> ${ORANGE}Mr. Wolf ${GREEN} solved our ${RED} problems ${NC} <"
    exit 0
fi


if [ $1 = "start" ]

    exit 0
fi

if [ $1 = "stop" ]
    
    exit 0
fi


if [ $1 = "remove" ]

    exit 0
fi


if [ $1 = "autodevmode" ]
then
    echo "${RED}[ATTENZIONE:] AVVIO IN AUTODEVMODE..."
    echo "${NC}============================================="
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
    git clone https://github.com/RedRoundRobin/swe-kafka-db thirema/kafka-db
    git clone https://github.com/RedRoundRobin/swe-gateway thirema/gateway
    git clone https://github.com/RedRoundRobin/swe-api thirema/api
    git clone https://github.com/RedRoundRobin/swe-telegram thirema/telegram
    git clone https://github.com/RedRoundRobin/swe-webapp thirema/webapp
    echo "${ORANGE}[Mr. Wolf] ${GREEN} Componenti scaricate con successo!"
    cp ./docker-compose.thirema.yml thirema/
    mv ./thirema/kafka-db/kafka/* thirema/
    echo "${ORANGE}[Mr. Wolf] ${NC} Installazione e avvio dei container Docker in corso..."
    docker-compose \
        -f thirema/docker-compose.yml \
        -f thirema/docker-compose.thirema.yml \
        up --build -d
    echo "${ORANGE}[Mr. Wolf] ${GREEN} Avvio dei container completato!"
    echo "${NC} ============================================="
    echo "${NC}> ${ORANGE}Mr. Wolf ${GREEN} solved our ${RED} problems ${NC} <"
    exit 0
fi