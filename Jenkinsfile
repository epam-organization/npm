#! user/bin env groovy

def params = [
    mpmInstall : 'nmp install',
    mpmTest    : 'nmp test',
    mpmStart   : 'nmp start'
]

properties ([
    pipelineTriggers([
        githubPush()
    ])
])

node ('macos'){
    try {
      checkout()        
      npm_install (params.npmInstall)
        stages {
          stage('test') {
            stages {
              sh 'npm test'
            }
          }
        }
        stages {
          stage('start') {
            stages {
              sh 'npm start'
            }
          }
        } catch(Exception e){
        currentBuild.result = 'FAILURE'
        } finally{
        notifyBuild(currentBuild.result)
        cleanWs()
        }
    } 
} 

def checkout(){
    stage ('Checkout')
    checkout scm
    echo 'This step was succesfuly'
}   

// def test(cmd){
//     stage('NPM test')
//     echo 'This is the second step'
// } 

// def npm_install(cmd){
//     stage('NPM Install')
//     echo 'This is the first step'
// }

// def start(cmd){
//     stage('NPM Start')
//     echo 'This is the last step'
// }