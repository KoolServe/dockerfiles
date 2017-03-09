# LEMP
An optimized LEMP stack in Docker using Docker compose.

## Setup
Clone this repo into a safe place and create a new directory in the root of the filesystem.
```
mkdir ~/dockerfiles; cd ~/dockerfiles
git clone git@github.com:KoolServe/dockerfiles.git .
cd lemp
sudo mkdir /docker
```

Next run the `update.sh` to pull all of the docker images used form the hub and start everything up.
```
chmod a+x update.sh
./update.sh
```

Everything _should_ work apart from Nginx. Firstly make a note of the mysql root account password. You can do this easily by grepping the logs for it. `ctr` + `c` out of the `update.sh` before running this.

```
docker-compose logs mysql | grep 'GENERATED ROOT PASSWORD:'
```

Nginx will need a little bit of configuring before it will work. Copy the nginx.conf file in this repo to the Nginx volume and then restart Nginx with
```
cp nginx.conf /docker/nginx/nginx.conf
docker restart nginx
```
or just run `update.sh`.
