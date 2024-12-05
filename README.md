# AEM Author Docker Container

## Prerequisites
- Docker
- Docker Compose
- AEM author JAR file (`aem-author-p4502.jar`)

## Setup Instructions

1. Place the `aem-author-p4502.jar` in the same directory as the Dockerfile

2. Build and run the container:
```bash
docker compose up --build
```

3. Access AEM Author:
- URL: http://localhost:4600
- Default credentials typically are: admin/admin (please change immediately)

## Notes
- The container exposes port 4600 for AEM Author
- A persistent volume is created to preserve AEM data
- Java options can be customized in the Dockerfile or docker-compose.yml

## Customization
- Adjust `JAVA_OPTS` to tune JVM memory settings
- Modify port mappings as needed




# Build container
docker compose up --build
# Start container
docker compose up -d
# View container logs:
docker logs -f aem-author
# Exec into the container and tail the specific log file
docker exec -it aem-author tail -f /opt/aem/crx-quickstart/logs/error.log
# Stop container
 docker stop aem-author
