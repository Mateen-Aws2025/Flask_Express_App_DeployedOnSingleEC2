#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Stopping Backend..."
cd "$BASE_DIR/backend"
./stop_backend.sh || true

echo "Stopping Frontend..."
cd "$BASE_DIR/frontend"
./stop_frontend.sh || true

echo "🛑 Backend and Frontend stopped!"

