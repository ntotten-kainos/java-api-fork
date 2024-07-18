FROM maven:amazoncorretto

WORKDIR /code
COPY . /code

# Add these params in when running `docker run ...`
# E.g. docker build --build-arg DB_HOST=<host address> --build-arg DB_NAME=<database name> ... and so on.
# Default values can be added here in the dockerfile or a .env file.


# Default value of db host
ARG DB_HOST
# Can be overwritten when building/running the container.
ENV DB_HOST=${DB_HOST}

# Must be provided when building or running. Do not store password.
ARG DB_PASSWORD
# MUST be provided at run time - never set/stored when container image is built.
ENV DB_PASSWORD=${DB_PASSWORD}

# Default value of db username
ARG DB_USERNAME
# can be overwritten at run time
ENV DB_USERNAME=${DB_USERNAME}

# Default value of db name
ARG DB_NAME
# Can be overwritten at run time
ENV DB_NAME=${DB_NAME} 

RUN mvn clean install -DskipTests=true

EXPOSE 8080

CMD [ "java", "-jar", "/code/target/JavaWebService-1.0-SNAPSHOT.jar", "server", "/code/config.yml" ]
