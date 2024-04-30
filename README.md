# Container toolbox
This repo contains a container image for deploying a toolbox container used for
debugging purposes.

## Description
This container deploys a HTTP server listening on port 8080 for holding the
container running, and prints some useful information about the container
itself.

## How to use it
There is a Makefile for building the image and running an example container
```sh
# Builds the container image
make build

# Runs a container example
make run

# Stops the example container
make stop

# Deploys the toolbox in your current context (K8s/Openshift)
make deploy

# Undeploys the toolbox in your current context (K8s/Openshift)
make undeploy
```

## Included tools
Tools list:
* vim
* git
* procps (ps)
* netcat
* wget
* DNS tools (dig, nslookup)
* ssh
* nmap

## License
This repo is licensed by Apache. Feel free to use it
