# Use Maven to build the project
FROM maven:3.8.8-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /app

# Copy the parent and child pom files and source code
COPY . /app

# Build the WAR using Maven
RUN mvn clean package

# Final image: Use Jetty to run the WAR
FROM jetty:9.4-jdk17

# Copy WAR file to Jetty webapps directory
COPY --from=build /app/webapp/target/webapp.war /var/lib/jetty/webapps/root.war

EXPOSE 8080

CMD ["java", "-jar", "/usr/local/jetty/start.jar"]
