SHELL_NAME ?= /bin/bash
BUILD_DIR := $(shell pwd)
TAG_NAME := galilee/docker-awscli-node

.PHONY: build shell

build:
	docker build -t $(TAG_NAME) .

shell:
	docker run --rm -ti -v $(shell pwd):/root $(TAG_NAME) $(SHELL_NAME)
