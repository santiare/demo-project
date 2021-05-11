pipeline {
    agent any

    stages {

	stage('SCM') {
            steps {
                git url: 'http://devsecops:gKNxUiWHWMEmsjZ1vY1G@10.245.64.11:10080/devsecops/demo-project.git'
            }
        }

        stage('Build') {
            steps {
                sh '''
                    ./build/mvn.sh mvn -B -DskipTests clean package
                    ./build/build.sh
                '''
            }

            post {
                success {
                   echo 'Post artifact to nexus'
                }
            }
        }

        stage('Test') {
            environment {
                DSO_Pass = credentials('sonar-pass')
            }
            steps {
                sh './test/mvn.sh mvn test'

                withSonarQubeEnv('Sonar-Scan') {
                    sh './build/mvn.sh mvn clean package sonar:sonar -Dsonar.login=admin -Dsonar.password=$DSO_Pass -Dsonar.host.url=http://10.245.64.11:9000'
                }

            }

            post {
                always {
                    echo 'Post artifact to nexus'
                }
            }
        }

        stage('Push') {
            steps {
                sh './push/push.sh'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploy to Kubernetes cluster'
		ansiblePlaybook credentialsId: 'dso-privkey', disableHostKeyChecking: true, installation: 'Ansible', inventory: 'hosts', playbook: 'deploy/ans-demo-service.yml'
		ansiblePlaybook credentialsId: 'dso-privkey', disableHostKeyChecking: true, installation: 'Ansible', inventory: 'hosts', playbook: 'deploy/ans-demo-deploy.yml'
            }
        }
    }
}
