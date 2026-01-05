pipeline {
    agent any

    environment {
        APP_DIR = "${WORKSPACE}"
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
                ./stop_app.sh || true
                '''
            }
        }

        stage('Install Backend Dependencies') {
            steps {
                sh '''
                cd $APP_DIR/backend
                python3 -m pip install --user -r requirements.txt
                '''
            }
        }

        stage('Install Frontend Dependencies') {
            steps {
                sh '''
                cd $APP_DIR/frontend
                npm install
                '''
            }
        }

        stage('Start Application') {
            steps {
                sh '''
                cd $APP_DIR
                ./start_app.sh
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Deployment Successful"
        }
        failure {
            echo "❌ Deployment Failed"
        }
    }
}
