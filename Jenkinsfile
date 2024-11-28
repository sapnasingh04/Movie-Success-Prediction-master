pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                git credentialsId: '0a506bdf-ee45-4c45-9c5b-858858b5dd5b', url: 'https://github.com/sapnasingh04/Movie-Success-Prediction-master.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'pytest tests/'  // Adjust to your test structure
            }
        }
        stage('Build') {
            steps {
                sh 'python manage.py collectstatic --noinput'
            }
        }
        stage('Deploy') {
            steps {
                sh './deploy.sh'  // Replace with your deployment script
            }
        }
    }
}
