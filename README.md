# divolte-collector-docker
Divolte Collector Docker image

#### Launch the Divolte Collector Container

#####Pull the image
```docker pull mkieboom/divolte-collector-docker```

#####Run the container with local volumes mounted
To store the click logs not in the Docker container itself but on the local filesystem, we can provide the docker container with local folders. The following folders are to be created on the local filesystem:
`/divolte_clicklogs/inflight` and `/divolte_clicklogs/published`.

```docker run -it -p 8290:8290 -v /divolte_clicklogs/inflight:/mnt/divolte_clicklogs/inflight -v /divolte_clicklogs/published:/mnt/divolte_clicklogs/published mkieboom/divolte-collector-docker /bin/bash```

Tips:

1. For users of the MapR Hadoop Distribution, provide the volume mapping using MapR unique NFS capabilities to directly write the avro files from the Docker container to the MapR cluster, eg:

  `-v /mapr/clustername/divolte_clicklogs/inflight:/mnt/divolte_clicklogs/inflight`

  `-v /mapr/clustername/divolte_clicklogs/published:/mnt/divolte_clicklogs/published`

2. Provide the port mapping as `-p 80:8290` to get Divolte running on port 80 for the external world which avoids any firewall restrictions blocking traffic to port 8290 to capture the clicks.

####Access the Divolte Collector webpage to simulate clicks
Divolte collector comes with a Web page to simulate clicks. In order to access this, the port is forwarded using the -p option in the docker run command above. To connect to the web ui please follow the steps depending on the OS on which Docker runs:

#####Using Docker on Linux
To access the Divolte collector page to simulate clicks please run the following command from the OS on which Docker runs:

```xdg-open http://localhost:8290```

#####Using boot2docker on Mac
When using boot2docker, there is an extra layer in between (the boot2docker virtual machine). To open the Divolte collector page to simulate clicks please run the following command from your Mac terminal:

```open http://$(boot2docker ip):8290```

This requires version 1.7.0 of boot2docker which includes "Container Port Redirection"

#####Analyze the click logs
Analyze the avro files containing the click logs using the following command:
find /tmp/*.avro -name '*divolte-tracking-*.avro' | sort | tail -n1 | xargs /usr/share/divolte/bin/avro-tools tojson --pretty
