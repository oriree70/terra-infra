pipeline {
    agent { node { label 'terra-node' } } 
    parameters {
        choice(name: 'deploy_choice', choices: ['apply', 'destroy'], description: 'The deployment type')
    }
    stages {
        stage('Checkout') {
            steps {
                // Checkout the repository
                git branch: 'main', url: 'https://github.com/oriree70/terra-infra.git'
            }
        }
        
        stage('1.Terraform init') {
            steps {
                dir('jenks_server') { // Update this to the correct path
                    echo 'terraform init phase'
                    sh 'terraform init'
                }
            }
        }
        
        stage('2.Terraform plan') {
            steps {
                dir('jenks_server') { // Update this to the correct path
                    echo 'terraform plan phase'
                    sh 'AWS_REGION=us-east-1 terraform plan'
                }
            }
        }
        
        stage('3.Manual Approval') {
            input {
                message "Should we proceed?"
                ok "Yes, we should."
                parameters {
                    choice(name: 'Manual_Approval', choices: ['Approve', 'Reject'], description: 'Approve or Reject the deployment')
                }
            }
            steps {
                echo "Deployment ${params.Manual_Approval}"
                script {
                    if (params.Manual_Approval == 'Reject') {
                        error 'User rejected the deployment'
                    }
                }
            }
        }
        
        stage('4.Terraform Apply/Destroy') {
            when {
                expression { params.deploy_choice == 'apply' || params.deploy_choice == 'destroy' }
            }
            steps {
                dir('jenks_server') { // Update this to the correct path
                    script {
                        if (params.deploy_choice == 'apply') {
                            echo 'Applying Terraform changes...'
                            sh 'terraform apply -auto-approve'
                        } else if (params.deploy_choice == 'destroy') {
                            echo 'Destroying Terraform infrastructure...'
                            sh 'terraform destroy -auto-approve'
                        }
                    }
                }
            }
        }
    }
}

