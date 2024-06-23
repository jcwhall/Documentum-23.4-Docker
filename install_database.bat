docker-compose -f compose_postgres-pgadmin.yml up -d
::Create a database file layout for the Documentum database. This needs to be the same name as the DOCBASE_NAME
docker exec -it postgres su -c "mkdir /var/lib/postgresql/data/db_dctm_dat.dat" postgres
