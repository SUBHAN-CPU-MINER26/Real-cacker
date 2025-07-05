#!/bin/bash
set -e

echo "📦 Checking available storage..."
df -h /tmp

echo "🗃️ Creating Docker data directory..."
sudo mkdir -p /tmp/docker-data

echo "⚙️ Setting Docker data-root config..."
sudo bash -c 'cat <<EOF > /etc/docker/daemon.json
{
  "data-root": "/tmp/docker-data"
}
EOF'

echo "🔁 Restarting Docker service..."
sudo systemctl restart docker || sudo service docker restart
sleep 3

echo "✅ Docker restarted and configured!"

echo "🧠 Loading environment variables..."
export $(grep -v '^#' .devcontainer/.env | xargs)

echo "🚀 Starting Windows10 container..."
docker-compose -f .devcontainer/windows10.yml up -d

echo "✅ Windows10 container is starting!"
echo "Use RDP to connect to port 3389 or web at port 8006 (if exposed)."
