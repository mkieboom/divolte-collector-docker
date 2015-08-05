# divolte-collector-docker
Divolte Collector Docker image

#### Launch the Divolte Collector Container

#####Pull the image
```docker pull mkieboom/divolte-collector-docker```

#####Run the container
```docker run -it mkieboom/divolte-collector-docker```

#####Start querying
```SELECT * FROM cp.`employee.json` LIMIT 5;```


####Access the Divolte Collector click webpage
Divolte collector comes with a Web page to simulate clicks. In order to access this, the port needs to be forwarded to the host running Docker. To do so, please run the Docker container with the `-p` option to publish the container's port to the host as follows:

```docker run -it -p 8290:8290 mkieboom/apache-drill-docker```

#####Using Docker on Linux
To access the Apache Drill Web UI please run:

```xdg-open http://localhost:8290```

#####Using boot2docker on Mac
When using boot2docker, there is an extra layer in between (the boot2docker virtual machine). To open the Apache Drill Web UI please run:

```open http://$(boot2docker ip):8290```

This requires version 1.7.0 of boot2docker which includes "Container Port Redirection"