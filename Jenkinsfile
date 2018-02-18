node {
    stage('Checkout') {
      def tfHome = tool name: 'Terraform', type: 'com.cloudbees.jenkins.plugins.customtools.CustomTool'
      env.PATH = "${tfHome}:${env.PATH}"
    }

    stage('Plan') {
      TFVERSION = sh (script: 'terraform --version',returnStdout: true).trim()
      echo "Terraform Version:  ${TFVERSION} -- Workspace:  ${env.WORKSPACE}"

      //Remove the terraform state file so we always start from a clean state
      if (fileExists(".terraform/terraform.tfstate")) {
        sh "rm -rf .terraform/terraform.tfstate"
      }
      if (fileExists("status")) {
        sh "rm status"
      }

      sh "ls -al"
      // Initialize terraform
      sh "terraform init"

      // Make sure modules are up to date
      sh "terraform get --update"

      // Create the Plan
      sh "set +e; terraform plan -out=terraform.tfplan -detailed-exitcode; echo \$? > status"
      def exitCode = readFile('status').trim()
      def apply = false
      echo "Terraform Plan Exit Code: ${exitCode}"
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
