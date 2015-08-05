# divolte-collector-docker
Divolte Collector Docker image

#### Launch the Divolte Collector Container

#####Pull the image
```docker pull mkieboom/divolte-collector-docker```

#####Run the container
```docker run -it mkieboom/divolte-collector-docker```


####Access the Divolte Collector webpage to simulate clicks
Divolte collector comes with a Web page to simulate clicks. In order to access this, the port needs to be forwarded to the host running Docker. To do so, please run the Docker container with the `-p` option to publish the container's port to the host as follows:

```docker run -it -p 8290:8290 mkieboom/divolte-collector-docker```

#####Using Docker on Linux
To access the Divolte collector page to simulate clicks please run:

```xdg-open http://localhost:8290```

#####Using boot2docker on Mac
When using boot2docker, there is an extra layer in between (the boot2docker virtual machine). To open the Divolte collector page to simulate clicks please run the following command from your Mac terminal:

```open http://$(boot2docker ip):8290```

This requires version 1.7.0 of boot2docker which includes "Container Port Redirection"