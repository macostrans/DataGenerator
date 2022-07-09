#!/bin/bash
curl -sSL https://get.docker.com/ | sh
docker swarm init --advertise-addr 
docker swarm join 
