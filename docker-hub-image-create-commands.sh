docker build -t macostrans/data-generator-api:v1
docker tag <existing-image> <hub-user>/<repo-name>[:<tag>]
docker commit 48c9b5dc7ea5 macostrans/data-generator-api:v1
docker push macostrans/data-generator-api:v1