SHORT_NAME ?= slugbuilder

export GO15VENDOREXPERIMENT=1

# Note that Minio currently uses CGO.

LDFLAGS := "-s -X main.version=${VERSION}"
IMAGE_PREFIX ?= deis
BINDIR := ./rootfs/bin

include versioning.mk

all: build docker-build docker-push

bootstrap:
	@echo Nothing to do.

build:
	@echo Nothing to do.

docker-build:
	docker build --rm -t ${IMAGE} rootfs
	docker tag -f ${IMAGE} ${MUTABLE_IMAGE}

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

test:
	@echo "Implement functional tests in _tests directory"

.PHONY: all bootstrap build docker-build docker-push deploy kube-pod kube-secrets \
	secrets kube-service kube-clean test
