#traefik
mkdir traefik
cd traefik
mkdir data
cd data
touch acme.json
chmod 600 acme.json
touch traefik.yml

docker network create proxy

touch docker-compose.yml

cd data
touch config.yml

sudo apt update
sudo apt install apache2-utils
echo $(htpasswd -nb "<USER>" "<PASSWORD>") | sed -e s/\\$/\\$\\$/g

cd traefik/data
nano config.yml
docker-compose up -d --force-recreate

#Portainer
mkdir portainer
cd portainer
touch docker-compose.yml
mkdir data

docker-compose up -d