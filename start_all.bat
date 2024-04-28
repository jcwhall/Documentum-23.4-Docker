::Database
docker start postgres
docker start pgadmin

::Docbase
docker start dctm-cs
::Crypto boot has to be run everytime the server starts otherwise the docbase service won't load.
docker exec --workdir /opt/dctm/dba --user dmadmin dctm-cs bash -c "dm_crypto_boot -all -passphrase ${AEK_PASSPHRASE}"
::Wait, then start all Docbase services
timeout /t 5
docker exec --user dmadmin dctm-cs /opt/dctm/dba/dm_start_dctm

::DA
timeout /t 10
docker start dctm-da

::xPlore
docker start cps
docker start indexserver
docker start indexagent
