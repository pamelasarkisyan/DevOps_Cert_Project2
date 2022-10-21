def branchName      = "main"
def gitServiceRepo  = "https://github.com/pamelasarkisyan/DevOps_Cert_Project2.git"
def imgName         = "pamela_devops_cert_project2"
def imageTag        = "${BUILD_NUMBER}"
def repoUrl         = "pamelasarkisyan"
def dockerfile      = "Dockerfile"

// Docker installed only on agent with devops label
node("devops"){
  stage ("Clean space") {
      cleanWs()
  }
  stage ("Clone")
  {
      withCredentials([string(credentialsId: 'public_github_pam', variable: 'public_github_pam')]) {
       sh ("git clone https://${public_github_pam}@github.com/pamelasarkisyan/DevOps_Cert_Project2.git")
      }
  }
  stage ('Build Docker Image')
     {
       sh ("cd DevOps_Cert_Project2 && docker build -t  ${imgName}:${imageTag} -f ${dockerfile} .")
     }
  stage ('tag Image With Build Number ')
     {
       sh ("docker tag ${imgName}:${imageTag}  ${repoUrl}'/'${imgName}:${imageTag}")
     }
   stage('Push Docker Image With Build Number To ECR')
     {
        sh("docker login --username pamelasarkisyan --password dckr_pat_doOmQJRBXiSZ5ntMHBsOt2hMzso")   
     }   
  stage('Push Docker Image With Build Number To ECR')
     {
        sh("docker push ${repoUrl}/${imgName}:${imageTag}")   
     }
  stage ("Run Docker Container ")
     {
      sh ("docker run ${repoUrl}/${imgName}:${imageTag} ")
     }
}
