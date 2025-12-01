#!/bin/bash

# Define network parameters
NETWORK_NAME="my-custom-bridge"
SUBNET="192.168.100.0/24"
GATEWAY="192.168.100.1"

# Create the Docker bridge network with subnet and gateway
echo "Creating Docker network '${NETWORK_NAME}' with subnet ${SUBNET} and gateway ${GATEWAY}..."
docker network create \
  --driver bridge \
  --subnet ${SUBNET} \
  --gateway ${GATEWAY} \
  ${NETWORK_NAME}

echo "Docker network '${NETWORK_NAME}' created."
