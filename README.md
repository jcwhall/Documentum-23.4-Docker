Documentum 23.4 Docker environment (Docker/Alpine/Postgres/DA/REST/SSO?)
========================================================================

# Overview
- Documentum Server 23.4
- Postgres 15.5
- Docker Engine 24.0.7 

# Prerequisites
- OpenText support account (with access to download Documentum software) https://support.opentext.com/
- Fast enough computer (TBC)

# Notes
- Setup on a Windows 11 host
- Checked Documentum compatability using the _OpenText Documentum Infrastructure Certification Guide_

# Instructions
## Install Docker
1. Install Docker (Engine or Desktop)
2. https://docs.docker.com/get-docker/
3. Start Docker



## Setup Postgres
1. Get postgres 15.5 docker image (terminal):
~~~
docker pull postgres:15.5
~~~
2. Check it's downloaded:
~~~
docker image ls
~~~
3. Create postgres container
~
docker run --network documentum-234-docker_default --name postgres-dctm-23.4 --hostname postgres -e POSTGRES_PASSWORD=password -d -p 5432:5432 postgres:15.5
docker run --name postgres-dctm-23.4 --hostname postgres -e POSTGRES_PASSWORD=password -d -p 5432:5432 postgres:15.5
~
4. Create a table space for Documentum
*Note the db_dctm_dat.dat file contains the name of the docbase e.g. db_<docbase>_dat.dat
~~~
docker exec -it postgres-dctm-23.4 su -c "mkdir /var/lib/postgresql/data/db_dctm_dat.dat" postgres
~~~


## Setup DCTM Content Server
1. Get Documentum Server 23.4 image from OpenText support
Login to OpenText support via docker
~
docker login registry.opentext.com
~
Pull the image
~
docker pull registry.opentext.com/dctm-server:23.4
~
Check it's downloaded
~
docker image ls
~
2. Download Script files
On the OpenText support site (https://support.opentext.com/) download _documentum_server_23.4_docker_compose_scripts.tar_
Unzip the tar.
3.
~
docker-compose -f CS-Docker-Compose_Stateless.yml up -d
~



# Useful
1. Check DB is working
Connect to the container
~~~
docker exec -u postgres -it postgres-dctm-23.4 bash
~~~
Login to DB and check it's working
~~~
psql
\l
~~~
Quit
~~~
\q
exit
~~~


pgAdmin
~~~
docker run --name pgadmin --network='documentum-234-docker_default' -p 82:80 -e 'PGADMIN_DEFAULT_EMAIL=jcwhall@gmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=password' -d dpage/pgadmin4
~~~