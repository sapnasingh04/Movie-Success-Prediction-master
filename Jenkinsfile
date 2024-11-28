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
                script {
                    // Debugging steps to ensure nohup is available
                    echo "Checking nohup availability"
                    sh 'which nohup || echo "nohup not found"'
                    
                    // Checking if nohup.out exists and has the correct permissions
                    echo "Checking permissions for nohup.out"
                    sh 'ls -l nohup.out || echo "nohup.out file does not exist"'

                    // Run the deployment script with error handling
                    echo "Running deployment script"
                    sh '''
                    # Make sure deploy.sh is executable
                    chmod +x ./deploy.sh

                    # Check if nohup is available and run it
                    if command -v nohup >/dev/null 2>&1; then
                        echo "nohup found, using nohup to run deploy script in the background"
                        nohup ./deploy.sh > nohup.out 2>&1 &
                    else
                        echo "nohup not found, running deploy script without nohup"
                        ./deploy.sh
                    fi
                    '''
                }
            }
        }
    }
}
