#!/usr/bin/env groovy
@Library('jenkins-library@master') _

pipeline {
    agent {
        node {
            label 'docker'
        }
    }

    triggers {
        pollSCM('* * * * *')
    }

    stages {
        stage('Build') {
            steps {
                sh "export DUKECON_JX_VERSION=':build' && docker-compose build"
                sh "export DUKECON_JX_VERSION=':build' && export NEW_VERSION=\$(docker-compose run jx jx --version) && " +
                        "docker tag dukecon/dukecon-jx\${DUKECON_JX_VERSION} dukecon/dukecon-jx:\${NEW_VERSION}"
            }
        }
    }
    post {
        always {
            sendNotification currentBuild.result
        }
        failure {
            mail to: 'gerd@aschemann.net',
                    subject: "Failed DukeCon Local Pipeline: ${currentBuild.fullDisplayName}",
                    body: "Something is wrong with ${env.BUILD_URL}"
        }
    }
}
