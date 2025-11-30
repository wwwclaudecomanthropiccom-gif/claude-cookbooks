# Deployment Guide

This guide covers how to set up, run, and access the unified Claude Cookbooks repository, including the ARIA Meta-Algorithmic Genesis System.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Docker Deployment](#docker-deployment)
- [ARIA Genesis System](#aria-genesis-system)
- [Jupyter Notebooks](#jupyter-notebooks)
- [Development Setup](#development-setup)
- [Troubleshooting](#troubleshooting)

---

## Overview

This repository contains a unified collection of:

- **Python Jupyter Notebooks**: Guides and examples for working with Claude API
- **ARIA Meta-Algorithmic Genesis System**: A Node.js implementation of self-evolving AI algorithms with emergent, non-linear intelligence growth
- **Tool Use Examples**: Integration patterns for Claude with external tools
- **Third-Party Integrations**: Examples with Pinecone, MongoDB, LlamaIndex, and more

### Project Structure

```
claude-cookbooks/
├── capabilities/           # Core capability demos (classification, RAG, etc.)
├── claude_agent_sdk/       # Agent SDK examples with Docker support
├── coding/                 # Code generation examples
├── extended_thinking/      # Extended thinking mode examples
├── finetuning/             # Fine-tuning guides
├── misc/                   # Miscellaneous utilities
├── multimodal/             # Vision and multimodal examples
├── node/                   # Node.js projects
│   └── aria-genesis/       # ARIA Meta-Algorithmic Genesis System
├── observability/          # Observability examples
├── patterns/               # Agent patterns (workflows, orchestration)
├── skills/                 # Custom skills framework
├── third_party/            # Third-party integrations
├── tool_use/               # Tool use examples
├── Dockerfile              # Unified Docker image
├── docker-compose.yml      # Multi-service orchestration
└── .env.example            # Environment configuration template
```

---

## Prerequisites

### For Docker Deployment (Recommended)

- Docker Engine 20.10+
- Docker Compose v2.0+
- 4GB+ RAM available for containers

### For Local Development

- Python 3.11+
- Node.js 18+
- npm 9+

---

## Quick Start

### Using Docker (Recommended)

1. **Clone the repository:**
   ```bash
   git clone https://github.com/wwwclaudecomanthropiccom-gif/claude-cookbooks.git
   cd claude-cookbooks
   ```

2. **Configure environment:**
   ```bash
   cp .env.example .env
   # Edit .env with your ANTHROPIC_API_KEY
   ```

3. **Start the ARIA Genesis System (infinite loop):**
   ```bash
   docker compose up aria-genesis
   ```

4. **Or start Jupyter Notebooks:**
   ```bash
   docker compose up jupyter
   # Access at http://localhost:8888 (token: claudecookbooks)
   ```

---

## Docker Deployment

### Build the Docker Image

```bash
docker compose build
```

### Available Services

| Service | Command | Description | Port |
|---------|---------|-------------|------|
| `aria-genesis` | `docker compose up aria-genesis` | ARIA Meta-Algorithmic Genesis System (runs forever) | - |
| `jupyter` | `docker compose up jupyter` | Jupyter Notebook server | 8888 |
| `dev` | `docker compose --profile dev run dev` | Interactive development shell | - |

### Run ARIA Genesis in Background

```bash
docker compose up -d aria-genesis
```

### View ARIA Genesis Logs

```bash
docker compose logs -f aria-genesis
```

### Stop All Services

```bash
docker compose down
```

### Remove All Data

```bash
docker compose down -v
```

---

## ARIA Genesis System

The ARIA (Artificial Recursive Intelligence Architecture) Meta-Algorithmic Genesis System is a simulation of self-evolving algorithmic intelligence featuring:

### Key Features

- **Emergent Intelligence Growth**: Non-linear intelligence increase through:
  - Phase transitions at critical thresholds
  - Synergistic interactions between capabilities
  - Positive feedback amplification loops
  - Spontaneous emergence from accumulated complexity
  - Cascade effects for sudden multi-capability improvements

- **Recursive Metacognition**: Algorithms that:
  - Think about thinking
  - Learn about learning
  - Optimize their own cognitive processes

- **Cross-Domain Problem Solving**: Solving problems across:
  - Mathematics
  - Physics
  - Computer Science
  - Neuroscience
  - Philosophy
  - Economics
  - Complex Systems
  - Artificial Intelligence

### Running ARIA Genesis

#### With Docker:
```bash
docker compose up aria-genesis
```

#### Without Docker:
```bash
cd node/aria-genesis
node aria-genesis.js
```

### Understanding the Output

The system displays real-time statistics including:

- **Generation**: Current evolutionary generation
- **Population**: Number of active algorithms
- **Avg Intelligence**: Average intelligence across population
- **Meta-Intelligence**: Self-reflection capability
- **Meta-Meta-Intelligence**: Recursive self-improvement
- **Phase State**: Current emergent phase (higher = more evolved)
- **Emergence Events**: Count of breakthrough moments
- **Cascade Events**: Sudden multi-capability improvements

### Stopping ARIA Genesis

Press `Ctrl+C` for graceful shutdown, or:
```bash
docker compose stop aria-genesis
```

---

## Jupyter Notebooks

### Starting the Notebook Server

```bash
docker compose up jupyter
```

Access at: `http://localhost:8888`
Default token: `claudecookbooks` (configurable in `.env`)

### Available Notebooks

| Category | Description |
|----------|-------------|
| `capabilities/` | Classification, RAG, summarization |
| `multimodal/` | Vision and image processing |
| `tool_use/` | Tool integration examples |
| `patterns/agents/` | Agent workflow patterns |
| `misc/` | Utilities and miscellaneous |
| `extended_thinking/` | Extended thinking mode |

### Running a Notebook

1. Navigate to the desired notebook
2. Ensure your `.env` has `ANTHROPIC_API_KEY` set
3. Run cells with Shift+Enter

---

## Development Setup

### Local Python Setup

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # or `venv\Scripts\activate` on Windows

# Install dependencies
pip install -r requirements.txt
pip install -r requirements-dev.txt
```

### Local Node.js Setup

```bash
cd node/aria-genesis
npm install
npm start
```

### Running Tests

```bash
# Python tests
pytest

# Validate notebooks
python scripts/validate_notebooks.py
```

### Linting

```bash
# Python linting
ruff check .
ruff format .
```

---

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `ANTHROPIC_API_KEY` | Your Anthropic API key | Required |
| `CLAUDE_MODEL` | Default Claude model | claude-haiku-4-5-20251001 |
| `NODE_ENV` | Node.js environment | production |
| `ARIA_CYCLE_DELAY` | Milliseconds between ARIA cycles | 2000 |
| `ARIA_FOUNDATION_COUNT` | Initial algorithm population | 5 |
| `JUPYTER_TOKEN` | Jupyter authentication token | claudecookbooks |
| `JUPYTER_PORT` | Jupyter server port | 8888 |

---

## Troubleshooting

### Docker Issues

**Container won't start:**
```bash
docker compose logs aria-genesis
```

**Permission denied:**
```bash
sudo chown -R $USER:$USER .
```

**Out of memory:**
Increase Docker memory limit in Docker Desktop settings.

### ARIA Genesis Issues

**No output appearing:**
- Ensure `tty: true` is set in docker-compose.yml
- Check logs: `docker compose logs -f aria-genesis`

**Intelligence not growing:**
- This is expected initially; emergent growth is non-linear
- Phase transitions happen suddenly after accumulation

### Jupyter Issues

**Can't connect to localhost:8888:**
- Check port mapping: `docker compose ps`
- Verify no other service on port 8888

**Token rejected:**
- Check `JUPYTER_TOKEN` in your `.env` file
- Default token is `claudecookbooks`

---

## Cloud Deployment

### AWS ECS

1. Build and push image to ECR:
   ```bash
   docker build -t claude-cookbooks .
   aws ecr create-repository --repository-name claude-cookbooks
   docker tag claude-cookbooks:latest <account>.dkr.ecr.<region>.amazonaws.com/claude-cookbooks
   docker push <account>.dkr.ecr.<region>.amazonaws.com/claude-cookbooks
   ```

2. Create ECS task definition with the container image
3. Configure environment variables from `.env`

### Google Cloud Run

```bash
gcloud builds submit --tag gcr.io/PROJECT_ID/claude-cookbooks
gcloud run deploy claude-cookbooks --image gcr.io/PROJECT_ID/claude-cookbooks
```

### Kubernetes

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: aria-genesis
spec:
  replicas: 1
  template:
    spec:
      containers:
      - name: aria-genesis
        image: claude-cookbooks:latest
        command: ["aria"]
        envFrom:
        - secretRef:
            name: claude-cookbooks-env
```

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on contributing to this repository.

## License

See [LICENSE](LICENSE) for license information.
