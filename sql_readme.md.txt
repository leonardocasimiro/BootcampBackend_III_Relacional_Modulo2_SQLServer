##### 	Instalamos SQL Server en Docker  #######################################
docker run -e "ACCEPT_EULA=Y" \
-e "SA_PASSWORD=Lem0nCode!" \
-e "MSSQL_PID=Express" \
-p 1433:1433 \
--name sqlserver \
-d mcr.microsoft.com/mssql/server:2017-latest-ubuntu

##### 	Instalamos SSMS Server en Docker  #######################################
https://learn.microsoft.com/es-es/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16#download-ssms

##### 	copiamos el backup al contenedor de Docker  #######################################
docker cp ./LemonMusic.bak sqlserver:/tmp