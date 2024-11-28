pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                // Explicitly checkout the 'main' branch
                git credentialsId: '0a506bdf-ee45-4c45-9c5b-858858b5dd5b', 
                    url: 'https://github.com/sapnasingh04/Movie-Success-Prediction-master.git', 
                    branch: 'main'
            }
        }
        stage('Install Dependencies') {
            steps {
                // Install dependencies listed in the requirements.txt file
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run Tests') {
            steps {
                // Run tests using pytest (adjust to your test structure if needed)
                sh 'pytest tests/'  // Adjust the test directory path if needed
            }
        }
        stage('Build') {
            steps {
                // Run Django management commands (or your equivalent build commands)
                sh 'python manage.py collectstatic --noinput'
            }
        }
        stage('Deploy') {
            steps {
                // Run your deployment script (make sure this script exists and is executable)
                sh './deploy.sh'  // Replace with your actual deployment script
            }
        }
    }
}
