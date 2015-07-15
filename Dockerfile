FROM ubuntu:14.04

#Give the container access to the host's /tmp
VOLUME /tmp

#install java
RUN apt-get update && apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
RUN apt-get update && apt-get install -y oracle-java7-installer

#install Mongo DB
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -cs)"/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN apt-get update && apt-get install -y mongodb-org
RUN mkdir -p /data/db
#I don't think we want to expose the database, so commenting out.
#EXPOSE 27017

# Add our microservice .jar to the container
COPY request-command-service.jar request-command-service.jar
RUN bash -c 'touch /request-command-service.jar'
EXPOSE 8080

# Add our container bootstrapping shell script and set it up to run on container startup
# This script will start mongodb and then our microservice application
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]