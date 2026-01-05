Flask & Express Apps Deployment on Single EC2 with CI/CD
Project Overview

This project demonstrates deploying a Flask (backend) and Express (frontend) application on a single EC2 instance, with a fully automated CI/CD pipeline using Jenkins.

Both applications run on the same EC2.

Deployment is automated via GitHub push triggers.

Deployment logs are saved per build for easy debugging.

EC2 Setup

Launch an EC2 instance (Amazon Linux 2 recommended).

Assign an Elastic IP to ensure a static address.

Install required tools:

Python3 → for Flask backend

NodeJS & npm → for Express frontend

Docker → optional, if using Docker deployment

Jenkins → for CI/CD automation

Repository Structure
Flask_Express_App_DeployedOnSingleEC2/
├── Jenkinsfile            # Pipeline definition
├── backend                # Flask backend code
├── frontend               # Express frontend code
├── start_app.sh           # Script to start both apps
├── stop_app.sh            # Script to stop both apps
├── backend.log            # Optional log
├── frontend.log           # Optional log
├── docker-compose.yml     # Optional, for Docker setup
├── package-lock.json      # Frontend dependency lock
└── logs/                  # Deployment logs per Jenkins build

CI/CD Pipeline (Jenkins)
Pipeline Steps

Checkout Code: Pull the latest code from GitHub.

Stop Running App: Stops both backend and frontend processes.

Install Dependencies:

Flask → pip install -r requirements.txt

Express → npm install

Start Application: Restarts backend and frontend using start_app.sh.

Logging: Deployment output is saved in logs/deploy_<BUILD_NUMBER>.log.

Notifications: Jenkins console shows success/failure messages.

Trigger

GitHub webhook configured to trigger on push events.

Payload URL: http://<Elastic_IP>:8080/github-webhook/

On push, Jenkins automatically redeploys the apps.

Scripts
start_app.sh

Starts both Flask and Express applications in the background.

Saves logs per build (if integrated with Jenkins BUILD_NUMBER).

stop_app.sh

Stops all running Flask and Express app processes to ensure clean restart.

Deployment Process

Push changes to GitHub.

Jenkins automatically triggers the pipeline via webhook.

Pipeline stops running apps, installs dependencies, and restarts them.

Deployment logs are saved in logs/.

Refresh the browser at http://<Elastic_IP> to see changes live.

CI/CD Workflow
GitHub Push → Webhook → Jenkins Pipeline → Stop Apps → Install Dependencies → Start Apps → Deployment Logs


Fully automated: No manual intervention required after push.

Any UI changes are reflected immediately after pipeline completion.

Evidence of Successful Deployment

Jenkins console logs showing successful build and deployment.

EC2 instance serving both Flask and Express apps accessible via Elastic IP.

Logs stored per build in logs/deploy_<BUILD_NUMBER>.log.
