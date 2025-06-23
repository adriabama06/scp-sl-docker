# SCP: Secret Laboratory Dedicated Server (Docker)

This project provides a Dockerized setup for running an SCP: Secret Laboratory dedicated server. You can deploy the server using Docker Compose or Portainer Stacks.

## Features
- Easy deployment and management of SCP:SL server
- Persistent configuration storage
- Customizable server port

---

## Deployment

### 1. Using Docker Compose

1. **Clone this repository** and navigate to the project directory `git clone https://github.com/adriabama06/scp-sl-docker.git`.
2. **Set environment variables** as needed (defaults are provided):
   - `SCPSL_PORT`: The UDP port for the server (default: `7777`)
   - `SCPSL_CONFIG_DIR`: Path for persistent config storage (default: `./data`)
3. **Start the server**:

```bash
SCPSL_PORT=7777 SCPSL_CONFIG_DIR=./data docker compose up -d
```

- The server will be available on the specified UDP port.
- Configuration files will be stored in the `data/` directory by default.

#### Example with custom variables:
```bash
SCPSL_PORT=7778 SCPSL_CONFIG_DIR=/my/config/path docker compose up -d
```

### 2. Using Portainer Stack

1. Open Portainer and go to **Stacks** > **Add Stack** > **Build method** > **Repository**.
2. Set `Repository URL` to `https://github.com/adriabama06/scp-sl-docker.git` and `Compose path` to `compose.portainer.yml`.
3. Set environment variables in the Portainer UI as needed:
   - `SCPSL_PORT` (e.g., `7777`)
   - `SCPSL_CONFIG_DIR` (e.g., `./data`)
4. Deploy the stack.

---

## Environment Variables
| Variable           | Default   | Description                                 |
|--------------------|-----------|---------------------------------------------|
| `SCPSL_PORT`       | `7777`    | UDP port for the SCP:SL server              |
| `SCPSL_CONFIG_DIR` | `./data`  | Host path for persistent config storage      |

---

## Volumes
- The server configuration is persisted in the directory specified by `SCPSL_CONFIG_DIR` (default: `./data`).

---
