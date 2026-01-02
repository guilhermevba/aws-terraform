pipeline {
    agent {
        label {
            filename 'Dockerfile.agent'
            dir 'docker'
            label 'terraform-agent'
            // Mount local .aws directory (read-only)
            args '-v "c:/Users/Guilherme/.aws:/home/jenkins/.aws:ro"'
        }
    }

    environment {
        TF_IN_AUTOMATION = '1'
        AWS_PROFILE      = 'default'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            input {
                message "Apply the plan?"
                ok "Yes, apply"
            }
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
