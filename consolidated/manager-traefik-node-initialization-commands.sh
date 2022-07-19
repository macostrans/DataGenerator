#!/bin/bash
curl -sSL https://get.docker.com/ | sh
docker network create --driver=overlay traefik-public
export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')
docker node update --label-add traefik-public.traefik-public-certificates=true $NODE_ID
export EMAIL=kannanoferode@gmail.com
