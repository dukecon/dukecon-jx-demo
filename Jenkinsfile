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
        buildDiscarder(
                logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5',
                        daysToKeepStr: '10', numToKeepStr: '20')
        )
    }

    triggers {
        cron('13 1 * * *')
        pollSCM('* * * * *')
    }

    stages {
        stage('Build') {
            steps {
                sh "export DUKECON_JX_VERSION=':build' && docker-compose build --no-cache"
                script {
                    NEW_VERSION=sh (returnStdout: true,
                            script: "DUKECON_JX_VERSION=':build' docker-compose run --rm jx jx --version").trim()
                    currentBuild.displayName = "${NEW_VERSION}"
                }
                sh "export NEW_VERSION=${NEW_VERSION} && " +
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
