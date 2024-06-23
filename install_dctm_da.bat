docker-compose -f compose_da.yml up -d
::Wait 10 seconds because updating the dfc.properties file straight away fails, due it being used
timeout /t 10
::Encrypt dm_bof_registry password + add it to the dfc.properties file
docker exec --env-file .env --workdir /opt/tomcat/webapps/da/WEB-INF/classes dctm-da bash -c "original=dfc.globalregistry.password=;bofregistrypassword=$(java -cp /opt/tomcat/webapps/da/WEB-INF/lib/dfc.jar com.documentum.fc.tools.RegistryPasswordUtils ${GLOBAL_REGISTRY_PASSWORD});sed -i "s~$original~$original$bofregistrypassword~g" dfc.properties"
docker exec dctm-da bash -c "tail /opt/tomcat/webapps/da/WEB-INF/classes/dfc.properties"