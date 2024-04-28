docker stop dctm-da
::Shutdown Docbase services
docker exec --user dmadmin dctm-cs /opt/dctm/dba/dm_shutdown_dctm
docker exec --user dmadmin dctm-cs /opt/dctm/dba/dm_stop_Docbroker
docker stop dctm-cs
docker stop cps
docker stop indexserver
docker stop indexagent
docker stop pgadmin
docker stop postgres