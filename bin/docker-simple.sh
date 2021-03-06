#! /bin/bash

COMMAND=$1

function help() {
	echo "start - build and up container"
	echo "stop - down container"
	echo "clean - removes unused containers"
	echo "logs - list logs"
	echo "list - list containers"
	echo "restart - down and start container"
}

function start() {
	docker-compose up -d --build --remove-orphans
}

function stop() {
	docker-compose down
}

function clean() {
	docker system prune -a
}

function logs() {
	docker-compose logs
}

function list() {
	docker-compose ps
}

function restart() {
	stop
	start
}

if [ "${COMMAND}" == "" ]; then
	help
fi

# run command
$COMMAND
