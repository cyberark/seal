#!/usr/vin/env groovy

pipeline {
    agent { label 'executor-v2'}
    triggers { cron('0 14 * * 1-5') }
    options { timestamps() }

    stages {
        stage('DEBUG env') {
          steps {
            sh 'printenv'
          }
        }
        // stage('Build Seal container image') {
        //     steps {
        //         sh './bin/build.sh'
        //     }
        // }
        //
        // stage('Run Seal bot') {
        //     when {
        //         branch 'master'
        //     }
        //     steps {
        //         sh './bin/morning_seal.sh'
        //     }
        // }
    }

    post {
        failure {
            slackSend(color: 'danger', message: 'FAILURE: could not run the Seal bot')
        }
    }
}
