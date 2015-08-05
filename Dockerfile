# Divolte 0.3.0
#
# VERSION 0.1 - not for production, use at own risk
#
# Divolte Documentation:
# www.divolte.io
#

#
# Using CentOS as the base image
#
FROM centos

MAINTAINER mkieboom @mapr.com

#
# Prerequisite: Install Java & initscripts and create some folders for later usage
#
RUN yum install -y initscripts java-1.8.0-openjdk-devel && \
    mkdir -p /divolte-scripts && \
    mkdir -p /run/lock/subsys

#
# Download and Install Divolte
# https://drill.apache.org/docs/installing-drill-on-linux-and-mac-os-x/
#
RUN curl -o divolte-collector-0.3.0-1.el7.centos.noarch.rpm http://divolte-releases.s3-website-eu-west-1.amazonaws.com/divolte-collector/0.3.0/distributions/divolte-collector-0.3.0-1.el7.centos.noarch.rpm && \
    rpm -ivh divolte-collector-0.3.0-1.el7.centos.noarch.rpm

#
# Deploy the divolte-env.sh file to configure the JAVA_HOME location
# JAVA_HOME="/usr/lib/jvm/java-1.8.0"
#
ADD divolte-env.sh /etc/divolte/divolte-env.sh
RUN chown root:root /etc/divolte/divolte-env.sh

#
# Start Divolte Collector Service
#
ADD bootstrap.sh /drill-scripts/bootstrap.sh
RUN chown root:root /drill-scripts/bootstrap.sh && \
    chmod 700 /drill-scripts/bootstrap.sh
ENV BOOTSTRAP /drill-scripts/bootstrap.sh

#
# Expose the Divolte Collector click simulation web page
#
EXPOSE 8290