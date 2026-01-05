pipeline {
    agent any

    environment {
        APP_DIR = "${WORKSPACE}"
        BUILD_ID = "${BUILD_NUMBER}"  // Unique build number for logs
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Mateen-Aws2025/Flask_Express_App_DeployedOnSingleEC2.git'
            }
        }

        stage('Stop Running App') {
            steps {
                sh '''
                cd $APP_DIR
                chmod +x start_app.sh stop_app.sh backend/*.sh frontend/*.sh
                echo "Stopping previous app..."
                ./stop_app.sh || true
                '''
            }
        }

        stage('Install Backend Dependencies') {
            steps {
                sh '''
                cd $APP_DIR/backend
                echo "Installing Flask dependencies..."
                python3 -m pip install --user -r requirements.txt
                '''
            }
        }

        stage('Install Frontend Dependencies') {
            steps {
                sh '''
                cd $APP_DIR/frontend
                echo "Installing Express dependencies..."
                npm install
                '''
            }
        }

        stage('Start Application') {
            steps {
                sh '''
                cd $APP_DIR
                echo "Starting application..."
                ./start_app.sh > logs/deploy_$BUILD_ID.log 2>&1 &
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Deployment Successful! Logs saved in logs/deploy_${BUILD_ID}.log"
        }
        failure {
            echo "❌ Deployment Failed! Check logs/deploy_${BUILD_ID}.log"
        }
    }
}
