docker network create --driver=overlay traefik-public
export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')
docker node update --label-add traefik-public.traefik-public-certificates=true $NODE_ID
export EMAIL=kannanoferode@gmail.com
export DOMAIN=datadeveloperfusion.com
export USERNAME=admin
export PASSWORD=password
export HASHED_PASSWORD=$(openssl passwd -apr1 $PASSWORD)
curl -L https://raw.githubusercontent.com/macostrans/DataGenerator/master/consolidated/FastAPI.docker-stack.yml  -o traefik-host.yml
docker stack deploy -c traefik-host.yml traefik