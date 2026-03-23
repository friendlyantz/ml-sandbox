.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m
# versions
APP_REVISION    = $(shell git rev-parse HEAD)

.PHONY: install
install:
	docker pull jupyter/scipy-notebook

.PHONY: run
run:
	docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v $(shell pwd):/home/jovyan/work jupyter/scipy-notebook

.PHONY: install-scipy-ruby
install-scipy-ruby:
	docker build -t jupyter/scipy-ruby .

.PHONY: run-ruby
run-ruby:
	docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v $(shell pwd):/home/jovyan/work jupyter/scipy-ruby

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "Getting started"
	@echo
	@echo "${YELLOW}make install${NC}                  pull/install scipy-notebook docker image"
	@echo "${YELLOW}make run${NC}                      launch app"
	@echo
	@echo "${YELLOW}make install-scipy-ruby${NC}       build scipy-notebook image with Ruby kernel"
	@echo "${YELLOW}make run-ruby${NC}                 launch app with Ruby kernel"
