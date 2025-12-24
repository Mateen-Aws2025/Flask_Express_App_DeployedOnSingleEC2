#!/bin/bash

echo "Starting Flask Backend..."

# Go to the directory where this script is located
cd "$(dirname "$0")"

# Kill any existing Python backend
pkill -f "python3 app.py" || true

# Start backend
nohup python3 app.py > backend.log 2>&1 &

echo "Backend started on port 5000"

