# ╔══════════════════════════════════════════════════════════════════════════╗
# ║         UNIFIED CLAUDE COOKBOOKS DEPLOYMENT                              ║
# ║  Multi-language containerized environment for AI experiments             ║
# ╚══════════════════════════════════════════════════════════════════════════╝

# Stage 1: Node.js base for ARIA Genesis
FROM node:20-slim AS node-base

# Stage 2: Python with Node.js
FROM python:3.11-slim

LABEL maintainer="Claude Cookbooks Team"
LABEL description="Unified environment for Claude Cookbooks including Python notebooks and Node.js ARIA Genesis System"

# Copy Node.js from node image
COPY --from=node-base /usr/local/bin/node /usr/local/bin/
COPY --from=node-base /usr/local/lib/node_modules /usr/local/lib/node_modules
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
    && ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# Install minimal system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Create application directory
WORKDIR /app

# Copy Python requirements first for better caching
COPY requirements.txt ./
COPY requirements-dev.txt ./

# Install Python dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt \
    || echo "Some Python packages may not install without network access"

# Copy Node.js ARIA Genesis System
COPY node/aria-genesis/ ./node/aria-genesis/

# Copy all project files
COPY . .

# Expose Jupyter notebook port
EXPOSE 8888

# Expose potential API ports
EXPOSE 8000
EXPOSE 3000

# Create entrypoint script
RUN echo '#!/bin/bash\n\
set -e\n\
\n\
case "$1" in\n\
  "aria")\n\
    echo "Starting ARIA Meta-Algorithmic Genesis System (Infinite Loop)..."\n\
    cd /app/node/aria-genesis\n\
    exec node aria-genesis.js\n\
    ;;\n\
  "jupyter")\n\
    echo "Starting Jupyter Notebook Server..."\n\
    exec jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root\n\
    ;;\n\
  "shell")\n\
    exec /bin/bash\n\
    ;;\n\
  *)\n\
    echo "Claude Cookbooks Unified Container"\n\
    echo "Usage: docker run <image> [aria|jupyter|shell]"\n\
    echo ""\n\
    echo "Commands:"\n\
    echo "  aria     - Run ARIA Meta-Algorithmic Genesis System (infinite loop)"\n\
    echo "  jupyter  - Start Jupyter Notebook server on port 8888"\n\
    echo "  shell    - Open interactive bash shell"\n\
    echo ""\n\
    echo "Default: Starting ARIA Genesis System..."\n\
    cd /app/node/aria-genesis\n\
    exec node aria-genesis.js\n\
    ;;\n\
esac\n\
' > /entrypoint.sh && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["aria"]
