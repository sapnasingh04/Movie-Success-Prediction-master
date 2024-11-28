pipeline {
    agent any

    environment {
        PYTHON_HOME = 'C:\\Users\\SAI MANOHAR\\AppData\\Local\\Programs\\Python\\Python311'
        PATH = "${PYTHON_HOME};${PYTHON_HOME}\\Scripts;${env.PATH}"
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning the repository...'
                git branch: 'main', url: 'https://github.com/sapnasingh04/Movie-Success-Prediction-master.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                echo 'Installing dependencies...'
                // Use the absolute path to pip
                bat '"C:\\Users\\SAI MANOHAR\\AppData\\Local\\Programs\\Python\\Python311\\Scripts\\pip.exe" install -r requirements.txt'
            }
        }
        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                // Assuming there is a test script to run
                bat 'python -m pytest'
            }
        }
        stage('Build') {
            steps {
                echo 'Building the project...'
                // Add your build commands here
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                // Add your deployment commands here
            }
        }
    }
    post {
        always {
            echo 'Pipeline execution completed.'
        }
        success {
            echo 'Pipeline succeeded.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
