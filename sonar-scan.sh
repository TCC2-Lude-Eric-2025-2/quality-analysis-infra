#!/bin/bash
set -e

# --- Build scanner image ---
echo "Building scanner image..."
docker build -t zulip-sonar-scanner -f Dockerfile-sonar-scanner .

# --- Run SonarQube scanner ---
echo "Running scanner..."
docker run --rm \
  --network host \
  -v "$(pwd)":/zulip \
  zulip-sonar-scanner
