pipeline {
    agent { node { label 'terra-node' } } 
    parameters {
        choice(name: 'deploy_choice', choices: ['apply', 'destroy'], description: 'The deployment type')
    }
    stages {
        stage('1.Terraform init') {
            steps {
                echo 'terraform init phase'
                sh 'terraform init'
            }
        }
        stage('2.Terraform plan') {
            steps {
                echo 'terraform plan phase'
                sh 'AWS_REGION=us-east-1 terraform plan'
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
                echo "Deployment ${Manual_Approval}"
                script {
                    if (params.Manual_Approval == 'Reject') {
                        error 'User rejected the deployment'
                    }
                }
            }
        }
    }
}
