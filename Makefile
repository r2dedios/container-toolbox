REPO_URL ?= "quay.io/avillega/"
REPO_NAME ?= "container-toolbox"
IMAGE_NAME ?= $(REPO_URL)$(REPO_NAME)
VERSION ?= $(shell cat VERSION)
IMAGE_TAG ?= $(shell git rev-parse --short=7 HEAD || echo "latest")
CE ?= $(shell which podman >/dev/null 2>&1 && echo podman || echo docker) # Container Engine

define HELP_MSG
Container toolbox for K8s/OCP Version: $(VERSION)
Makefile Targets:
	* \033[1;97mall\033[0m: Build
	* \033[1;97mbuild\033[0m: Build the container image locally
	* \033[1;97mrun\033[0m: Run the toolbox locally
	* \033[1;97mattach\033[0m: Attach your CLI to the toolbox
	* \033[1;97mstop\033[0m: Stops the toolbox
	* \033[1;97mhelp\033[0m: Displays this message
endef

export HELP_MSG


.PHONY: build all run attach stop help
all: build

build:
	$(CE) build -t $(IMAGE_NAME):$(VERSION) -f ./Containerfile .

run:
	$(CE) run -p 8080:8080 -d --name container-tool $(IMAGE_NAME):$(VERSION)

attach:
	$(CE) exec -it container-tool bash

stop:
	$(CE) stop container-tool
	$(CE) rm container-tool

help:
	@echo -e "$$HELP_MSG"
