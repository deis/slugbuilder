SHORT_NAME ?= slugbuilder

export GO15VENDOREXPERIMENT=1

# Note that Minio currently uses CGO.

LDFLAGS := "-s -X main.version=${VERSION}"
IMAGE_PREFIX ?= deis
BINDIR := ./rootfs/bin

include versioning.mk

SHELL_SCRIPTS = $(wildcard _scripts/*.sh) $(wildcard rootfs/bin/*) $(wildcard rootfs/builder/*)

# The following variables describe the containerized development environment
# and other build options
DEV_ENV_IMAGE := quay.io/deis/go-dev:0.11.0
DEV_ENV_WORK_DIR := /go/src/${REPO_PATH}
DEV_ENV_CMD := docker run --rm -v ${CURDIR}:${DEV_ENV_WORK_DIR} -w ${DEV_ENV_WORK_DIR} ${DEV_ENV_IMAGE}
DEV_ENV_CMD_INT := docker run -it --rm -v ${CURDIR}:${DEV_ENV_WORK_DIR} -w ${DEV_ENV_WORK_DIR} ${DEV_ENV_IMAGE}

all: build docker-build docker-push

bootstrap:
	@echo Nothing to do.

build:
	@echo Nothing to do.

docker-build:
	docker build --rm -t ${IMAGE} rootfs
	docker tag ${IMAGE} ${MUTABLE_IMAGE}

deploy: docker-build docker-push

kube-pod: kube-service
	kubectl create -f ${POD}

kube-secrets:
	- kubectl create -f ${SEC}

secrets:
	perl -pi -e "s|access-key-id: .+|access-key-id: ${key}|g" ${SEC}
	perl -pi -e "s|access-secret-key: .+|access-secret-key: ${secret}|g" ${SEC}
	echo ${key} ${secret}

kube-service: kube-secrets
	- kubectl create -f ${SVC}

kube-clean:
	- kubectl delete rc deis-${SHORT_NAME}-rc

test: test-style test-unit test-functional

test-style:
	${DEV_ENV_CMD} shellcheck $(SHELL_SCRIPTS)

test-unit:
	@echo "Implement unit tests in _tests directory"

test-functional:
	@echo "Implement functional tests in _tests directory"

.PHONY: all bootstrap build docker-build docker-push deploy kube-pod kube-secrets \
	secrets kube-service kube-clean test
