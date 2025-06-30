# Use the official n8n image as base
FROM docker.n8n.io/n8nio/n8n:latest

# Switch to root to install dependencies
USER root

# Install Python3, pip3, nano
RUN apk update && \
    apk add --no-cache python3 py3-pip nano

# Create a virtual environment and install g4f
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir g4f

# Ensure the virtualenv's binaries are on PATH
ENV PATH="/opt/venv/bin:$PATH"

# Return to the n8n (node) user
USER node
