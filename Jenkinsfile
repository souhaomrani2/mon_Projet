pipeline {
    agent any
    environment {
        PM_API_URL = "https://192.168.127.134:8006/api2/json"
        PM_USER = "root"
        PM_PASSWORD = "rootroot"
        TEMPLATE = "template"
        TARGET_NODE = "node"
        TARGET_STORAGE = "node"
        BRIDGE = "your-bridge-name"
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
                sh 'terraform plan -var="pm_api_url=${PM_API_URL}" -var="pm_user=${PM_USER}" -var="pm_password=${PM_PASSWORD}" -var="template=${TEMPLATE}" -var="target_node=${TARGET_NODE}" -var="target_storage=${TARGET_STORAGE}" -var="bridge=${BRIDGE}" -var="disk_size=${DISK_SIZE}" -var="os_type=${OS_TYPE}" -out=tfplan'
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

