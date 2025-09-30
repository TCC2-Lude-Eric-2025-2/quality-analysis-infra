#!/bin/bash
set -e

# --- Build scanner image ---
echo "Building scanner image..."
docker build -t zulip-sonar-scanner -f Dockerfile-sonar-scanner .

# Get vagrant virtualized environment up and running
vagrant up --provider=docker

# Run tests inside vagrant environment
vagrant ssh -c "./tools/test-backend --coverage --xml-report"

# --- Run SonarQube scanner ---
echo "Running scanner..."
docker run --rm \
  --network host \
  -v "$(pwd)":/zulip \
  zulip-sonar-scanner
