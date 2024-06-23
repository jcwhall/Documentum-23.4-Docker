 docker-compose -f compose_dctm-cs.yml up -d
::Follow the logs until the installation is complete.

docker logs --follow dctm-cs
::Wait for the following message to be displayed:
::   USAGE : /opt/dctm_docker/scripts/start_all_services.sh
::After that terminate the tail and stop the container using:
::   docker stop dctm-cs