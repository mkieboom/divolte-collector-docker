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
# Prerequisite: Install Java and initscripts
#
RUN yum install -y initscripts java-1.8.0-openjdk-devel

#
# Download and Install Divolte
# https://drill.apache.org/docs/installing-drill-on-linux-and-mac-os-x/
#
RUN curl -o divolte-collector-0.3.0-1.el7.centos.noarch.rpm http://divolte-releases.s3-website-eu-west-1.amazonaws.com/divolte-collector/0.3.0/distributions/divolte-collector-0.3.0-1.el7.centos.noarch.rpm && \
    rpm -ivh divolte-collector-0.3.0-1.el7.centos.noarch.rpm

#
# Start Divolte Collector Service
#
RUN service divolte-collector start

#
# Expose the Divolte Collector click simulation web page
#
EXPOSE 8290