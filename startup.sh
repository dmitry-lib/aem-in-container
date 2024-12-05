#!/bin/bash

# Start AEM JAR in the background
java -jar /opt/aem/aem-author-p4502.jar &

# Wait for AEM to start (checking port 4502)
echo "Waiting for AEM to start..."
while ! nc -z localhost 4502; do
  sleep 5
done
echo "AEM started successfully"

# Change to WKND project directory
cd /opt/aem/aem-guides-wknd

# Run Maven clean install
mvn clean install -PautoInstallSinglePackage

# Keep the container running
wait