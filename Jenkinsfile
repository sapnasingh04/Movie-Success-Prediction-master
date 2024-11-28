pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Pull the latest code from GitHub
                git branch: 'main', 
                    credentialsId: 'github-token', 
                    url: 'https://github.com/sapnasingh04/Movie-Success-Prediction-master.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install Python dependencies (Django and other libraries)
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                // Run unit tests or other validations
                sh 'python manage.py test'
            }
        }

        stage('Build') {
            steps {
                // Create database migrations
                sh 'python manage.py makemigrations'
                sh 'python manage.py migrate'
            }
        }

        stage('Deploy') {
            steps {
                // Run the Django application
                sh 'python manage.py runserver 0.0.0.0:8000 &'
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
