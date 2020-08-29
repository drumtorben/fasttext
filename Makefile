.PHONY: all

all: clean build binary

DOCKER_IMAGE_PREFIX=fasttext:latest# must be lower case
DOCKER_BUILD_CMD=docker build
DATADIR=data
RESULTDIR=result
SCRIPTDIR=scripts

DOCKER_CMD=docker run --rm -it \
      -v ${PWD}/${SCRIPTDIR}:/${SCRIPTDIR} \
      -v ${PWD}/${RESULTDIR}:/${RESULTDIR} \
      -v ${PWD}/${DATADIR}:/${DATADIR} \
      ${DOCKER_IMAGE_PREFIX}

build:
	$(DOCKER_BUILD_CMD) -t $(DOCKER_IMAGE_PREFIX) -f Dockerfile .

# -----
# Other make options below
# -----

run:
	$(DOCKER_CMD) /bin/bash

train:
	$(DOCKER_CMD) ./scripts/train.sh

test:
	$(DOCKER_CMD) ./scripts/test.sh

predict:
	$(DOCKER_CMD) ./scripts/predict.sh

