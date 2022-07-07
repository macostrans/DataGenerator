curl -sSL https://get.docker.com/ | sh
docker swarm init --advertise-addr 165.22.246.252
docker swarm join --token SWMTKN-1-3s9p03vnidzplmgygw9ywoje4uz6lryo1kpjvq671iue15xajx-42ksqzghql0yegr21kl1uzjqr 165.22.246.252:2377
