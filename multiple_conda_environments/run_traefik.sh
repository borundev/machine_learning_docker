#!/bin/bash
traefik_network=`docker network ls | awk '{print $2}' | grep -w traefik | wc -l`
if ((traefik_network == 0));
then
  docker network create traefik
fi
docker-compose -f ../traefik/docker-compose.yml up -d
