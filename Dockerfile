# Use a base image with Java 11 and Maven
FROM maven:3.8.4-openjdk-11-slim

# Install git and netcat (for checking port availability)
RUN apt-get update && apt-get install -y git netcat

# Set working directory
WORKDIR /opt/aem

# Copy the AEM author JAR file into the container
COPY aem-author-p4502.jar .

# Expose the default AEM author port
EXPOSE 4502

# Set environment variables if needed
ENV JAVA_OPTS="-Xmx2048m"

# Command to run the AEM JAR
ENTRYPOINT ["java", "-jar", "aem-author-p4502.jar"]
