pipeline {
    agent any
    environment {
        PM_API_URL = "https://192.168.127.134:8006/api2/json"
        PM_TOKEN = "your_proxmox_token_here"
        TEMPLATE = "your_template_name_here"
        TARGET_NODE = "your_target_node_here"
        TARGET_STORAGE = "your_target_storage_here"
        BRIDGE = "your_bridge_name_here"
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
