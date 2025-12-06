#!/bin/bash

echo "Starting Frontend Express App..."

cd /home/ubuntu/Flask_Express_App_DeployedOnSingleEC2/frontend

# Kill existing node processes
pkill -f "node server.js"

# Start server
nohup node server.js > frontend.log 2>&1 &

echo "Frontend started on port 3000"
