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
RUN yum install -y tar java-1.8.0-openjdk-devel && \
    mkdir -p /opt/divolte

#
# Download and Install Divolte
# https://drill.apache.org/docs/installing-drill-on-linux-and-mac-os-x/
#
RUN curl -o divolte-collector-0.3.0.tar.gz http://divolte-releases.s3-website-eu-west-1.amazonaws.com/divolte-collector/0.3.0/distributions/divolte-collector-0.3.0.tar.gz && \
    tar zxpf divolte-collector-0.3.0.tar.gz -C /opt/divolte


#
# Set the JAVA_HOME location to "/usr/lib/jvm/java-1.8.0"
#
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0
ENV PATH $PATH:$JAVA_HOME/bin

#
# Specify the location where to store the avro clicklog files using divolte-collector.conf
#
ADD divolte-collector.conf /opt/divolte/divolte-collector-0.3.0/conf/divolte-collector.conf
RUN chown root:root /opt/divolte/divolte-collector-0.3.0/conf/divolte-collector.conf

#
# Expose the Divolte Collector click simulation web page
#
EXPOSE 8290

ENTRYPOINT ["/opt/divolte/divolte-collector-0.3.0/bin/divolte-collector"]