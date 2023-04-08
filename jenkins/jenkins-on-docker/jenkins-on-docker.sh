#!/bin/bash

<<com

Jenkins docker image declares the entry point in a way that you can easily pass arguments to the jenkins.
Lets say you have your keystore (e.g. self-signed in this example) as jenkins_keystore.jks in the home folder of ubuntu ec2 instance. Here is the example how to generate one:
keytool -genkey -keyalg RSA -alias selfsigned -keystore jenkins_keystore.jks -storepass mypassword -keysize 2048
Now you can easily configure jenkins to run on https only without creating your own docker image:

docker run -v /home/ubuntu:/var/jenkins_home -p 443:8443 jenkins --httpPort=-1 --httpsPort=8443 --httpsKeyStore=/var/jenkins_home/jenkins_keystore.jks --httpsKeyStorePassword=mypassword

    -v /home/ubuntu:/var/jenkins_home exposes the host home folder to the jenkins docker container
    -p 443:8443 maps 8443 jenkins port in the container to the 443 port of the host
    --httpPort=-1 --httpsPort=8443 blocks jenkins http and exposes it with https on port 8443 inside the container
    --httpsKeyStore=/var/jenkins_home/jenkins_keystore.jks --httpsKeyStorePassword=mypassword provides your keystore that has been mapped from the host home folder to the container /var/jenkins_home/ folder.

com

keytool -genkey -keyalg RSA -alias selfsigned -keystore jenkins_keystore.jks -storepass mypassword -keysize 2048

docker run -v /Users/bharat.verma/code/personal/devops/jenkins/docker:/var/jenkins_home -p 8080:8080 jenkins/jenkins:latest --httpPort=-1 --httpsPort=8080 --httpsKeyStore=/var/jenkins_home/jenkins_keystore.jks --httpsKeyStorePassword=mypassword
