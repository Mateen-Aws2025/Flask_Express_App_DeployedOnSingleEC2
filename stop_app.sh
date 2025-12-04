#!/bin/bash

# Stop Flask backend
pkill -f app.py

# Stop Node/Express frontend
pkill -f server.js

echo "🛑 Backend and Frontend stopped!"

