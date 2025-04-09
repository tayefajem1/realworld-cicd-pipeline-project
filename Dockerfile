# Use Maven as the base image
FROM maven:3.8-openjdk-11

# Set the working directory inside the container
WORKDIR /app

COPY ./target/smaven-project-1.0-SNAPSHOT.jar /app/

# Command to run the Java application
CMD ["java", "-jar", "target/maven-project-1.0-SNAPSHOT.jar"]
