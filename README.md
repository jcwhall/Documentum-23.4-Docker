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

## Create Local Bridge Network
Create a local network so that the images can talk to each other
~~~
docker network create dctm-23.4
~~~


## Setup Postgres
1. Get postgres 15.5 docker image (terminal):
~~~
docker pull postgres:15.5
~~~
2. Check it's downloaded:
~~~
docker image ls
~~~
3. Run the image, passing in arguments
~~~
docker run --network dctm-23.4 --name postgres-dctm-23.4 --hostname postgres -e POSTGRES_PASSWORD=password -d -p 5432:5432 postgres:15.5
~~~
4. Check DB is working
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
