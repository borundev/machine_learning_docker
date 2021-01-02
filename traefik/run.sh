#!/bin/bash

COMPOSEFILES=" -f docker-compose.yml"

EXTRA="${@:2}"

source source_environment_variables.sh

up() {
  docker-compose ${COMPOSEFILES} up -d ${EXTRA}
}

down() {
  docker-compose ${COMPOSEFILES} down ${EXTRA}
}

start() {
  docker-compose ${COMPOSEFILES} start ${EXTRA}
}

stop() {
  docker-compose ${COMPOSEFILES} stop ${EXTRA}
}

ps() {
  docker-compose ${COMPOSEFILES} ps ${EXTRA}
}

full() {
  docker-compose ${COMPOSEFILES} ${EXTRA}
}

case "$1" in
    up)   up ;;
    down) down;;
    start) start;;
    stop) stop;;
    ps) ps;;
    full) full;;

esac

