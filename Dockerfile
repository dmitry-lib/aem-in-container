# Use a base image with Java 11 and Maven
FROM maven:3.8.4-openjdk-11-slim

# Install git and netcat (for checking port availability)
RUN apt-get update && apt-get install -y git netcat

# Set working directory
WORKDIR /opt/aem

# Copy AEM author JAR
COPY aem-author-p4502.jar ./

# Copy startup script
COPY startup.sh ./
RUN chmod +x startup.sh

# Clone the WKND repository
RUN git clone https://github.com/adobe/aem-guides-wknd.git

# Set working directory to the cloned project
WORKDIR /opt/aem/aem-guides-wknd

# Expose AEM author port
EXPOSE 4502

# Use the startup script as the entrypoint
ENTRYPOINT ["/bin/bash", "/opt/aem/startup.sh"]