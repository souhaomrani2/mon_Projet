pipeline {
    agent any
    stages {
        stage('Test GitHub Connection') {
            steps {
                script {
                    def gitUrl = 'https://github.com/souhaomrani/mon_Projet.git'
                    // Checkout the GitHub repository using configured credentials
                    checkout([$class: 'GitSCM',
                              branches: [[name: '*/main']],
                              doGenerateSubmoduleConfigurations: false,
                              extensions: [[$class: 'CloneOption', depth: 1, noTags: false, reference: '', shallow: true]],
                              userRemoteConfigs: [[url: gitUrl]]])
                    echo "Connection to GitHub repository successful"
                }
            }
        }
        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                // Plan Terraform changes
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                // Apply Terraform changes
                sh 'terraform apply tfplan'
            }
        }
    }
    post {
        always {
            // Cleanup any temporary files if needed
            sh 'rm -rf .terraform terraform.tfstate tfplan'
        }
    }
}