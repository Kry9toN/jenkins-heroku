FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y \
&& apt-get install -y git openjdk-11-jdk ssh

#
# Clone repo and prepare working directory
#
RUN git clone -b master https://github.com/Kry9toN/jenkins-heroku /home/jenkins
WORKDIR /home/jenkins

CMD ["java", "-jar", "jenkins.war", "--httpPort=$PORT", "--ajp13Port=-1", "--httpsPort=-1"]
