#!/bin/bash

echo "Starting Frontend Express App..."

# Go to the directory where this script is located
cd "$(dirname "$0")"

# Kill existing frontend
pkill -f "node server.js" || true

# Start server
nohup node server.js > frontend.log 2>&1 &

echo "Frontend started on port 3000"

