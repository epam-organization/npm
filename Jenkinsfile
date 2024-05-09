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

node {
    try {
        checkout()        
        npm_install (params.npmInstall)
        test (params.npmTest)
        start (params.npmStart)
    } catch(Exceptio e){
        currentBuild.result = 'FAILURE'
    } finally{
        notifyBuild(currentBuild.result)
        cleanWs()
    } 
} 

def checkout(){
    stage ('Checkout')
    checkout scm
}   

def test(cmd){
    stage('NPM test')
} 