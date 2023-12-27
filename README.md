# Bootcamp Backend III - [Relacional] Laboratorio Modulo 2 - SQL Server

![Limon llorando...](./img/ssms_logo.png)

Para esta práctica se nos solicita:

- Restaurar una BBDD y crear una serie de consultas para recuperar información.
- Modelado relacional.

## Requerimientos Previos

> Para restaurar la BBDD necesitamos seguir los siguientes pasos:

#### 1. Instalamos SQL Server en Docker  
docker run -e "ACCEPT_EULA=Y" \
-e "SA_PASSWORD=Lem0nCode!" \
-e "MSSQL_PID=Express" \
-p 1433:1433 \
--name sqlserver \
-d mcr.microsoft.com/mssql/server:2017-latest-ubuntu

#### 2. Instalamos SSMS Server en Docker  
https://learn.microsoft.com/es-es/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16#download-ssms


#### 3. Copiamos el backup al contenedor de Docker  
> Descarga el script para crear la BDD
<a href="https://workingful-lemoncode.s3.eu-west-3.amazonaws.com/campus/bootcamp-backend/laboratorio-modulo-2-sql-server/Create%20LemonMusic%20database.sql">Create LemonMusic database.sql</a>

#### y tambien puedes:

> Descarga del BU y restaura en el contenedor a traves del :
https://workingful-lemoncode.s3.eu-west-3.amazonaws.com/campus/bootcamp-backend/laboratorio-modulo-2-sql-server/LemonMusic.bak

> Copia del BU al contenedor:

```
docker cp ./LemonMusic.bak sqlserver:/tmp
```

> Restaura el BU desde Microsoft SQL Management Studio o ejecuta el script

## Consultas

> Chequea el fichero "consultas.script.sql"

## Extras (opcional)

> Chequea el fichero "consultas-extra.script.sql"