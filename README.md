# java-api

Database
---
1. Create an empty database
1. Run the following command from the base of your cloned directory to create the required database structure:
```
mysql --host=<localhost> --user=<your_username> --password=<your_password> <your_database_name> < employeesdb.sql
```

Config
---
1. The following environment variables need to be set to enable database connection:
```
DB_USERNAME
DB_PASSWORD
DB_HOST
DB_NAME
```

How to start the java-api application
---

1. Run `mvn clean install -DskipTests=true` to build your application
1. Start application with `java -jar target/JavaWebService-1.0-SNAPSHOT.jar server config.yml`
1. To check that your application is running enter url `http://localhost:8080`

Swagger
---

To see your applications Swagger UI `http://localhost:8080/swagger`

Tests
---

1. Run `mvn clean test` to run unit tests
2. Run `mvn clean integration-test` to run integration tests

Running with docker
---
1. `docker build -t myapp:<ver> .` to build the docker container image of the app. 
2. `docker run --env-file build_params.env -p 8080:8080 myapp:<ver>` where build_params.env is the environment file for setting env variables
3.  You can specify new DB_HOST, DB_USERNAME, DB_NAME, and DB_PASSWORD variables to be passed to the container at runtime by altering the build_params.env file.
4. Remember to ensure that the port exposed in the dockerfile matches the port mapping used in `-p 8080:8080`.
