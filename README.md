docker-loggly
==============

##About

###Description
Docker image designed to send ContainerShip container logs to Loggly

###Author
ContainerShip Developers - developers@containership.io

##Usage
This image is designed to send all ContainerShip application logs to Loggly. Running this image elsewhere is not recommended as the container may be unable to start.

###Configuration
The following environment variables are required for the container to start properly:

* `LOGGLY_ACCOUNT` - Loggly account name
* `LOGGLY_TOKEN` - Loggly api token
* `LOGGLY_USERNAME` - Loggly username
* `LOGGLY_PASSWORD` - Loggly password

### Requirements
* On your ContainerShip cluster, run this application using the `constraints.per_node=1` tag. Each node in your cluster will run an instance of the container, sending all application logs to Loggly.
* Start the application with `container_volume=/var/log/containership` and `host_volume=/var/log/containership` so all application logs are accessible inside the container.

##Contributing
Pull requests and issues are encouraged!
