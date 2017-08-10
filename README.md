# Loggly

See https://www.loggly.com/ for more information about Loggly.

## What is the Containership Marketplace?

The Containership marketplace is a series of containerized applications configured to easily run and scale on a [containership.io](https://containership.io) cluster! Many conveniences such as High-Availability, automatic clustering among others are able to be configured out of the box allowing you to scale seamlessly as your infrastructure is required to grow.

> **Note:** If you attempt to run this image outside of a containership cluster, we cannot guarantee that it will run properly.

### Author
ContainerShip Developers - developers@containership.io

### Configuration
The following environment variables are required for the container to start properly:

* `LOGGLY_ACCOUNT` - Loggly account name
* `LOGGLY_TOKEN` - Loggly api token
* `LOGGLY_USERNAME` - Loggly username
* `LOGGLY_PASSWORD` - Loggly password

### Requirements
* On your ContainerShip cluster, run this application using the `constraints.per_node=1` tag. Each node in your cluster will run an instance of the container, sending all application logs to Loggly.
* Start the application with `container_volume=/var/log/containership` and `host_volume=/var/log/containership` so all application logs are accessible inside the container.

## Contributing
Pull requests and issues are encouraged!
