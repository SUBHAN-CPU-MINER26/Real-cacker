#!/bin/bash
set -e

echo "🔧 Setting up Docker with custom data-root at /tmp/docker-data..."

# Create custom Docker data dir
sudo mkdir -p /tmp/docker-data

# Write custom daemon config
sudo bash -c 'cat <<EOF > /etc/docker/daemon.json
{
  "data-root": "/tmp/docker-data"
}
EOF'

# Restart Docker
echo "🔁 Restarting Docker..."
sudo service docker restart || sudo systemctl restart docker

# Wait for Docker
sleep 5

echo "✅ Docker restarted with custom config"

# Pull and run Windows10 container
echo "🚀 Starting Windows10 container using docker-compose..."
docker-compose -f .devcontainer/windows10.yml up -d

echo "✅ Container started. You can RDP into it via port 3389 (or use browser if supported)."
