Documentum 23.4 Docker environment (DB/CS/DA/xPlore)
========================================================================

# Overview
- Docker Engine 24.0.7 
- Postgres 15.5
- Documentum Server 23.4
- Documentum Administrator 23.4
- xPlore 22.1.4

# Prerequisites
- OpenText support account (with access to download Documentum software) https://support.opentext.com/
- Fast enough PC (not a potato...)

# Notes
- Setup on a Windows 11 host (should work fine on a OSX/Linux machine but .bat files will need renaming)
- Checked Documentum compatability using the _OpenText Documentum Infrastructure Certification Guide_
- Uses the .yml files _documentum_server_23.4_docker_compose_scripts.tar_ available from OpenText support (edited version included here)
- Docbase/Content Server/CS are used interchangeably but all mean the same thing.
- YML files could be combined into one
- No custom images have been used (e.g. taking an OT image and makes updates to it). This is so that new versions can be easily swapped in/out

# INSTALLATION
## Install Docker
1. Install Docker (Engine or Desktop)
2. https://docs.docker.com/get-docker/
3. Start Docker

## Setup environment variables
1. Edit the .env file and make any required changes (you can use the values as-is):

## Download Images
1. The OpenText images are from a private OpenText registry. 
~~~
download_opentext_images.bat
~~~
2. Enter your OpenText support credentials when requested.
3. Check the images have downloaded either within Docker Desktop or using:
~~~
docker image ls
~~~
The other images will be downloaded automatically from Docker hub when used for the first time

## Install Database
1. Run:
~~~
install_database.bat
~~~
## Install CS/Docbase
1. Run:
~~~
install_dctm_cs.bat
~~~
2. Wait for the Docbase to complete installation (could be 20/30 minutes depending on your computer)
Wait for the following message to be displayed:
~~~
USAGE : /opt/dctm_docker/scripts/start_all_services.sh
~~~
3. After that terminate the tail, and run:
~~~
restart_cs.bat
~~~
## Install DA
1. Run:
~~~
install_dctm_da.bat
~~~
## Install xPlore
1. Run:
~~~
install_xplore.bat
~~~
## Complete Installation
1. Run:
~~~
stop_all.bat
start_all.bat
~~~
Installation is now _complete_.

# USEFUL COMMANDS / INFORMATION
## Starting the enviornment
~~~
start_all.bat
~~~

## Stopping the environment
~~~
stop_all.bat
~~~

## Starting xPlore
1. Open up IndexAgent, Login using the install owner credentials (dmadmin): http://localhost:9200/IndexAgent
Select 'Start Index Agent in normal mode'. 
Full-Text searches can now be performed

## Logging into a running container
Login to a container (in this case dctm-cs) and opening a bash terminal
~~~
docker exec -it dctm-cs bash
~~~

## URLs
- DA: http://localhost:8080/da
- xPlore IndexAgent: http://localhost:9200/IndexAgent
- xPlore dSearch (check that it's working): http://localhost:9300/dsearch
- xPlore dSearch Admin console: http://localhost:9300/dsearchadmin
- pgAdmin: http://localhost:8888/

## xPlore dSearch
The xPlore administration console can be found at: http://localhost:9300/dsearchadmin
Default login details are:
name: admin
password: password

## Check Postgres database is working
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

## Validate a docker compose YML file
~~~
docker-compose -f compose_dctm_base.yml config
~~~

## Using pgAdmin to access Database
Open up pgAdmin and login using the PGADMIN details within .env
http://localhost:8888/

## View all running processes in a container
~~~
ps -e
~~~

# REFERENCES
- OpenText support site: https://support.opentext.com/
- Documentum Forum: https://forums.opentext.com/forums/developer/categories/documentum_developer/
- Great Documentum blog: https://blog.aldago.es/