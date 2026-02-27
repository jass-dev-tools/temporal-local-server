
# Temporal Server with Docker

## Dockerfile Overview

The provided Dockerfile is based on **Ubuntu 20.04** and will:

- Download and install the **Temporal CLI**.
- Run **Temporal** in development mode.
- Expose the required ports: `7233`, and `5000`.

## Prerequisites

Before running the Docker container, ensure that you have **Docker** installed on your system. Below are the installation instructions for **Mac**, **Linux**, and **Windows**.

### Install Docker on Mac

1. Download **Docker Desktop for Mac** from the official Docker website:
   - [Download Docker Desktop for Mac](https://docs.docker.com/desktop/install/mac-install/)

2. Open the `.dmg` file and drag **Docker** to the **Applications** folder.

3. Launch **Docker Desktop** and wait until it is fully running.

4. Verify Docker installation with:

   ```bash
   docker --version
   ```

### Install Docker on Linux

1. Update your system packages:

   ```bash
   sudo apt-get update
   ```

2. Install required dependencies:

   ```bash
   sudo apt-get install -y \
       apt-transport-https \
       ca-certificates \
       curl \
       software-properties-common
   ```

3. Add Docker’s GPG key:

   ```bash
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   ```

4. Set up the Docker repository:

   ```bash
   echo \
     "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```

5. Install Docker:

   ```bash
   sudo apt-get update
   sudo apt-get install -y docker-ce docker-ce-cli containerd.io
   ```

6. Verify Docker installation with:

   ```bash
   docker --version
   ```

### Install Docker on Windows

1. Download **Docker Desktop for Windows**:
   - [Download Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/)

2. Run the installer and follow the instructions.

3. Launch **Docker Desktop** and verify the installation:

   ```bash
   docker --version
   ```

## Building and Running the Temporal Docker Container

1. **Clone the repository**:

   ```bash
   git clone <your-repository-url>
   cd <repository-directory>
   ```

2. **Build the Docker image**:

   ```bash
   docker build -t temporal-server .
   ```

3. **Run the Docker container**:

   ```bash
   docker run -p 8080:8080 -p 7233:7233 -p 5000:5000 temporal-server
   ```

4. Once the container is running, the following services will be available:
   - Temporal server (gRPC) on port `7233`.
   - Temporal UI on port `5000`.

## Ports Information
- `7233`: Temporal's gRPC service.
- `5000`: Temporal's UI.

## Stopping the Container

To stop the container, first find the container ID:

```bash
docker ps
```

Then stop it with:

```bash
docker stop <container-id>
```

Or simply use the container name if specified with `--name`.

## Additional Notes

- The Temporal server is running in **development mode**, intended for testing and local development only.
- For advanced configurations, including deploying Temporal in production, please refer to the [official Temporal documentation](https://docs.temporal.io).
