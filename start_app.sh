#!/bin/bash

# Navigate to backend and start Flask in background
cd ~/flask-node-assignment/backend
nohup python3 app.py > backend.log 2>&1 &

# Navigate to frontend and start Node/Express in background
cd ~/flask-node-assignment/frontend
nohup node server.js > frontend.log 2>&1 &

echo "✅ Backend and Frontend started!"
echo "Backend: http://13.239.21.235:5000"
echo "Frontend: http://13.239.21.235:3000"

