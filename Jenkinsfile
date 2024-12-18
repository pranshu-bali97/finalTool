pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply without manual approval?')
    } 
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = 'ap-south-1'
    }

    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/DipanshuRawat/finalTool.git', branch: 'main'
            }
        }

        stage('Plan') {
            steps {
                sh 'pwd;cd Terraform/ ; terraform init'
                sh 'pwd;cd Terraform/ ; terraform validate'
                sh 'pwd;cd Terraform/ ; terraform plan'
            }
        }

        stage('Apply') {
            steps {
                script {
                    if (params.autoApprove) {
                        sh 'pwd;cd Terraform/ ; terraform apply --auto-approve'
                    } else {
                        input message: 'Do you want to proceed with Apply?', ok: 'Yes'
                        sh 'pwd;cd Terraform/ ; terraform apply --auto-approve'
                    }
                }
            }
        }

        stage('Destroy Approval') {
            steps {
                script {
                    input message: 'Do you want to proceed with Destroy?', ok: 'Yes'
                    sh 'pwd;cd Terraform/ ; terraform destroy --auto-approve'
                }
            }
        }
    }
}
