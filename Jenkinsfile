pipeline {
    agent {
                label 'agentlinux'
            }
    stages {
        stage('Checkout Code') {
            steps {
                script {
                    checkout([
                        $class: 'GitSCM',
                        branches: [[name: "*/${params.BRANCH}"]],
                        userRemoteConfigs: [[
                            url: 'git@github.com:MapColonies/helm-charts.git',
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
	    stage("publish junit report") {
            steps{
                echo "publishing junit"
                junit skipMarkingBuildUnstable: true, testResults: 'xmlReport/output.xml'
            }
        }
	    stage("Publish Allure Report")	{
		steps{
			echo "Publish Allure"
			allure includeProperties: false, jdk: '', results: [[path: 'allure_results']]
		}
	}

    }
}