#! /bin/bash

COMMAND=$1

function help() {
    echo "start - build and up container"
    echo "stop - down container"
    echo "logs - list logs"
    echo "list - list containers"
    echo "restart - down and start container"
    echo "ssh - login to container"
}

function start() {
    docker-compose up -d --build
}

function stop() {
    docker-compose down
}

function restart() {
    stop
    start
}

function logs() {
    docker-compose logs
}

function list() {
    docker-compose ps
}

function ssh() {
    docker exec -u root -it php73 bash
}

if [ "${COMMAND}" == "" ]; then
    help
fi

# run command
$COMMAND
