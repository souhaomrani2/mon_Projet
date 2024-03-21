pipeline {
    agent any
    environment {
        TF_CLI_ARGS = "-input=false" // Set Terraform to non-interactive mode
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/souhaomrani/mon_Projet.git' // Checkout your Terraform files from version control
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init' // Initialize Terraform
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan' // Plan Terraform changes
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply tfplan' // Apply Terraform changes
            }
        }
    }
    post {
        always {
            sh 'rm -rf .terraform terraform.tfstate tfplan' // Cleanup any temporary files if needed
        }
    }
}
