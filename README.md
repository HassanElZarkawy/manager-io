# Manager.io Docker Setup

This repository contains Docker configuration files to easily deploy Manager.io server - a powerful, free accounting software with a web interface.

## Overview

Manager.io is a comprehensive accounting software solution that can be run as a server application. This Docker setup makes it easy to deploy and maintain Manager.io in your environment with proper data persistence.

## Prerequisites

- Docker installed on your system
- Docker Compose installed on your system
- Internet connection (for initial build)

## Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/HassanElZarkawy/manager-io.git
   cd manager-io
   ```

2. Create a directory for persistent data:
   ```bash
   mkdir manager_data
   ```

3. Start the container:
   ```bash
   docker-compose up -d
   ```

4. Access Manager.io through your web browser:
   ```
   http://localhost:8080
   ```

## Repository Contents

- `Dockerfile`: Defines how to build the Manager.io Docker image
- `docker-compose.yaml`: Defines the service configuration for easy deployment
- `manager_data/`: Directory for persistent storage of all Manager.io data

## Data Persistence

All Manager.io data is stored in the `./manager_data` directory, which is mounted to the `/data` directory inside the container. This ensures:

- Your accounting data persists across container restarts
- You can easily access, backup, or restore your data files
- You can migrate your setup to another system by copying this directory

## Configuration Options

### Changing the Port

If you want to use a different port than 8080, modify the `ports` section in the `docker-compose.yaml` file:

```yaml
ports:
  - "8081:8080"  # Change 8081 to your desired port
```

### Automatic Restart

The container is configured to restart automatically unless manually stopped. You can modify this behavior by changing the `restart` parameter in `docker-compose.yaml`.

## Upgrading

The Dockerfile is configured to download the latest version of Manager.io during build. To upgrade your installation:

```bash
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

## Troubleshooting

### Container fails to start

Check the logs:
```bash
docker-compose logs
```

### Cannot access Manager.io web interface

Verify the container is running:
```bash
docker-compose ps
```

Check if port 8080 is already in use by another application on your system.

## License

This Docker configuration is provided under the MIT License. Manager.io software itself is proprietary and subject to its own licensing terms.

## Acknowledgments

- [Manager.io](https://www.manager.io/) for providing the accounting software
- Mono Project for the runtime environment

---

*Note: This is not an official Manager.io project.*