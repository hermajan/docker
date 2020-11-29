#! /bin/bash

COMMAND=$2

function help() {
    echo -e "usage:
    \t bash docker.sh IMAGE COMMAND [PARAMETER]
    \t\t IMAGE = folder with Docker image
    \t\t COMMAND = command from list below
    \t\t PARAMETER = optional parameter for command"

    echo -e "commands:
    \t clean - cleans state of Docker for running containers
    \t down - downs container (stops and removes it)
    \t list - lists containers
    \t logs - lists logs
    \t port [NUMBER] - stops containers on port from parameter NUMBER
    \t prune - prunes containers (removes unused containers)
    \t restart - downs and starts container
    \t service [NAME] - restarts Docker service of image with NAME or empty NAME for all
    \t ssh - logins to container
    \t start - builds and startups container
    \t stop - stops container"
}

DIR="$(cd "$(dirname "$0")" && pwd)"

cd ${DIR}/$1

function clean() {
    echo -e "TODO"
}

function down() {
    docker-compose down
}

function list() {
    docker-compose ps
}

function logs() {
    docker-compose logs
}

function port() {
    docker ps
    echo -e "\n"

    echo "Looking for a container on port: ${3///}"
    ID=$(docker container ls --format="{{.ID}}\t{{.Ports}}" | grep ${3///} | awk '{print $1}')

    # if ID is not empty
    if [ ! -z "${ID}" ]; then
        echo "Found container ID: ${ID} - stopping it"
        docker container stop ${ID}
    else
        echo "Not found container on port: ${3///}"
    fi
}

function prune() {
    docker system prune -a
}

function restart() {
    down
    start
}

function service() {
    docker-compose restart $3
}

function ssh() {
    docker exec -u root -it ${1///} bash
}

function start() {
    docker-compose up -d --build
    echo -e "\n"
    list
}

function stop() {
    docker-compose stop
}

if [ "${COMMAND}" == "" ]; then
    help
fi

# run command
$COMMAND $*
