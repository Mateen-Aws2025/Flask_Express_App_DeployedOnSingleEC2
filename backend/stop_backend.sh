#!/bin/bash

echo "Stopping Flask Backend..."

pkill -f "python3 app.py"

echo "Backend stopped"
