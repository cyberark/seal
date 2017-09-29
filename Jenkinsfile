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
