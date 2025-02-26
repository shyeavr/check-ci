pipeline {
        agent {
        kubernetes {
            cloud 'kubernetes'
            yamlFile 'podSpec.yaml'
        }
    }
    stages {
        stage('Checkout Code') {
            steps {
                script {
                    checkout([
                        $class: 'GitSCM',
                        branches: [[name: "*/${params.BRANCH}"]],
                        userRemoteConfigs: [[
                            url: 'git@github.com:shyeavr/check-ci.git',
                            credentialsId: 'mapcolonies-devops-key'
                        ]]
                    ])
                }
            }
        }
		stage('Run Tests') {
           steps {
				echo "Setup and run API Tests"
				sh('bash ./jenkinsscript.sh')

          }
        }
	    stage("Publish Allure Report")	{
            steps{
                echo "Publish Allure"
                allure includeProperties: false, jdk: '', results: [[path: '${WORKSPACE}/allure-results']]
            }
	}

    }
}