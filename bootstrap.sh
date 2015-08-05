#!/bin/bash
echo ""
echo ""
echo "###############################################################################################"
echo "# Welcome to the Divolte Collector v0.3.0 Docker image                                        #"
echo "#                                                                                             #"
echo "# To connect to the Divolte Collector webpage to simulate clicks please run the following:    #"
echo "#                                                                                             #"
echo "# Using Docker on Linux:                                                                      #"
echo "# xdg-open http://localhost:8290                                                              #"
echo "#                                                                                             #"
echo "# Using boot2docker on Mac:                                                                   #"
echo "# open http://\$(boot2docker ip):8290                                                          #"
echo "#                                                                                             #"
echo "# Analyze the avro files containing the click logs using the following command:               #"
echo "# find /tmp/*.avro -name '*divolte-tracking-*.avro' | sort | tail -n1 | xargs /usr/share/divolte/bin/avro-tools tojson --pretty #"
echo "###############################################################################################"
echo ""
echo ""
echo "Starting Divolte Collector service..."
echo ""
echo ""

#
# Export JAVA_HOME
#
export JAVA_HOME=/usr/lib/jvm/java-1.8.0/

#
# Start Divolte Collector service
#
service divolte-collector start

#
# Open a shell
#
/bin/bash