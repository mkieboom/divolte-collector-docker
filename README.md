# divolte-collector-docker
Divolte Collector Docker image

#### Launch the Divolte Collector Container

#####Pull the image
```docker pull mkieboom/divolte-collector-docker```

#####Run the container
```docker run -it -p 8290:8290 mkieboom/divolte-collector-docker /divolte-scripts/bootstrap.sh```


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