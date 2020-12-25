#!/bin/bash
export NB_UID=$(id -u)
export NB_GID=$(id -g)
export NB_USER=$(whoami)
export NOTEBOOKS_FOLDER='/home/borundev/Google Drive/machine_learning'
export HOSTNAME='borundev-desktop'
docker-compose up --build --force-recreate tensorflow_and_pytorch tensorboard
