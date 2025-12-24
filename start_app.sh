#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Starting Backend..."
cd "$BASE_DIR/backend"
./start_backend.sh

echo "Starting Frontend..."
cd "$BASE_DIR/frontend"
./start_frontend.sh

echo "✅ Backend and Frontend started!"


