#!/bin/bash

COMPOSEFILES=" -f docker-compose.yml"
SERVICES="multiple_conda_environments_dev"

EXTRA="${@:2}"

source source_environment_variables.sh

up() {
  docker-compose ${COMPOSEFILES} up -d ${EXTRA} ${SERVICES}
}

down() {
  docker-compose ${COMPOSEFILES} down ${EXTRA}
}

start() {
  docker-compose ${COMPOSEFILES} start ${EXTRA} ${SERVICES}
}

stop() {
  docker-compose ${COMPOSEFILES} stop ${EXTRA} ${SERVICES}
}

ps() {
  docker-compose ${COMPOSEFILES} ps ${EXTRA}
}

full() {
  docker-compose ${COMPOSEFILES} ${EXTRA} ${SERVICES}
}

exec() {
  docker-compose ${COMPOSEFILES} exec ${EXTRA}
}

case "$1" in
    up)   up ;;
    down) down;;
    start) start;;
    stop) stop;;
    ps) ps;;
    exec) ps;;
    full) full;;
esac
