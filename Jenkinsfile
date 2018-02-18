node {
    stage('Checkout') {
      def tfHome = tool name: 'Terraform', type: 'com.cloudbees.jenkins.plugins.customtools.CustomTool'
      env.PATH = "${tfHome}:${env.PATH}"
    }

    stage('Plan', concurrency: 1) {
      TFVERSION = sh (
        script: 'terraform --version',
          returnStdout: true
        ).trim()
      )
      
      echo "Terraform Version:  ${TFVERSION} -- Workspace:  ${env.WORKSPACE}"
    }
    stage('Build') {
        // slackSend channel: 'ecm-notifications', color: 'good', message: "Building ${env.JOB_NAME} - ${env.BUILD_NUMBER} (${env.BUILD_URL})  ${env.BUILD_TAG}"
        // Start the build
        sh 'echo "hello world"'
    }
    stage('Test') {
        // Perform some testing
        sh 'echo "hello world: test"'
    }
    stage('Deploy') {
        // Deploy the build
        sh 'echo "hello world: deploy"'
    }
}
