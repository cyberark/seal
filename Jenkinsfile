#!/usr/vin/env groovy

pipeline {
    agent { label 'executor-v2'}
    options { timestamps() }

    stages {
        stage('Build Seal container image') {
            steps {
                sh './bin/build.sh'
            }
        }

        stage('Push Seal container image to internal registry') {
            steps {
                sh './bin/push-image.sh'
            }
        }
    }

    post {
        failure {
            slackSend(color: 'danger', message: 'FAILURE: could not build and push Seal image')
        }
    }
}

pipeline {
    agent { label 'executor-v2'}
    // triggers { cron('0 14 * * 1-5') }
    triggers { cron('* * * * *') }
    options {
        timestamps()
        overrideIndexTriggers(false)
    }

    stages {
        stage('Run Seal bot') {
            when {
                branch 'master'
            }
            steps {
                sh './bin/morning_seal.sh'
            }
        }
    }

    post {
        failure {
            slackSend(color: 'danger', message: 'FAILURE: could not run the Seal bot')
        }
    }
}

