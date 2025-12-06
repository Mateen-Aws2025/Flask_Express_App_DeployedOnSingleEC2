#!/bin/bash

echo "Starting Flask Backend..."

# Go to backend directory
cd /home/ubuntu/Flask_Express_App_DeployedOnSingleEC2/backend

# Kill any existing Python process
pkill -f "python3 app.py"

# Start backend
nohup python3 app.py > backend.log 2>&1 &

echo "Backend started on port 5000"

