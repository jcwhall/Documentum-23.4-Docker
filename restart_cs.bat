::Shutdown Docbase services
docker exec --user dmadmin dctm-cs /opt/dctm/dba/dm_shutdown_dctm
docker exec --user dmadmin dctm-cs /opt/dctm/dba/dm_stop_Docbroker
docker stop dctm-cs
docker start dctm-cs
timeout /t 5
docker exec --user dmadmin dctm-cs /opt/dctm/dba/dm_start_dctm