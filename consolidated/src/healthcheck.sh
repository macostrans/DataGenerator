#!/bin/sh

host="localhost"

if health="$(curl -fsSL "http://$host:80/healthcheck")"; then
	if [ "$health" = '"healthy"' ]; then
		exit 0
	fi
	echo >&2 "unexpected health status: $health"
fi

exit 1