pipeline {
    agent any
    environment {
        PM_API_URL = "https://192.168.127.134:8006/api2/json"
        PM_TOKEN = "faf0b3f2-8df5-48ec-b726-6fadc60aa5d1"
        TEMPLATE = "101"
        TARGET_NODE = "pve"
        TARGET_STORAGE = "local-lvm"
        BRIDGE = "vmbr0"
        DISK_SIZE = "1G"
        OS_TYPE = "l26"
    }
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
               sh 'terraform plan -var="template=${TEMPLATE}" -out=tfplan'
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
