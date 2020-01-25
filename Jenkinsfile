#!/usr/bin/env groovy
@Library('jenkins-library@master') _

pipeline {
    agent {
        node {
            label 'docker'
        }
    }

    options {
        disableConcurrentBuilds()
    }

    triggers {
        cron('13 1 * * *')
        pollSCM('* * * * *')
    }

    stages {
        stage('Build') {
            steps {
                sh "export DUKECON_JX_VERSION=':build' && docker-compose build --no-cache"
                sh "export DUKECON_JX_VERSION=':build' && export NEW_VERSION=\$(docker-compose run jx jx --version) && " +
                        "docker tag dukecon/dukecon-jx\${DUKECON_JX_VERSION} dukecon/dukecon-jx:\${NEW_VERSION} && " +
                        "docker push dukecon/dukecon-jx:\${NEW_VERSION} && " +
                        "docker tag dukecon/dukecon-jx\${DUKECON_JX_VERSION} dukecon/dukecon-jx:latest && " +
                        "docker push dukecon/dukecon-jx:latest"
            }
        }
        stage('Build documentation') {
            steps {
                withMaven {
                    sh 'mvn clean package'
                }
            }
        }
        stage('Publish documenation') {
            steps {
                publishHTML target: [
                        allowMissing: false,
                        alwaysLinkToLastBuild: false,
                        keepAll: true,
                        reportDir: 'target/generated-docs/',
                        reportFiles: 'index.html',
                        reportName: 'Documentation'
                ]
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
