::Database
docker-compose -f compose_postgres-pgadmin.yml up -d
::Create a database file layout for the Documentum database. This needs to be the same name as the DOCBASE_NAME
docker exec -it postgres su -c "mkdir /var/lib/postgresql/data/db_dctm_dat.dat" postgres
::Content Server/Docbase
docker-compose -f compose_dctm-cs.yml up -d
::xPlore
docker-compose -f compose-xplore.yml up -d
::DA
docker-compose -f compose_da.yml up -d
timeout /t 10
::Encrypt dm_bof_registry password + add it to the dfc.properties file within the DA container
docker exec --env-file .env --workdir /opt/tomcat/webapps/da/WEB-INF/classes dctm-da bash -c "original=dfc.globalregistry.password=;bofregistrypassword=$(java -cp /opt/tomcat/webapps/da/WEB-INF/lib/dfc.jar com.documentum.fc.tools.RegistryPasswordUtils ${GLOBAL_REGISTRY_PASSWORD});sed -i "s~$original~$original$bofregistrypassword~g" dfc.properties"
::Follow the CS install logs
docker logs --follow dctm-cs
::Wait for the following message to be displayed:
::   USAGE : /opt/dctm_docker/scripts/start_all_services.sh
::After that terminate the tail, restart all services using stop_all and start_all scripts