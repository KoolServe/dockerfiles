curl -s https://raw.githubusercontent.com/KoolServe/dockerfiles/master/lemp/docker-compose.yml > docker-compose.yml
docker-compose pull
docker-compose up -d --remove-orphans
docker-compose logs -f
