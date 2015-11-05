SHORT_NAME := slugbuilder

export GO15VENDOREXPERIMENT=1

# Note that Minio currently uses CGO.

VERSION := 0.0.1-$(shell date "+%Y%m%d%H%M%S")
LDFLAGS := "-s -X main.version=${VERSION}"
BINDIR := ./rootfs/bin
DEV_REGISTRY ?= $$DEV_REGISTRY
DEIS_REGISTRY ?= ${DEV_REGISTRY}

IMAGE := ${DEIS_REGISTRY}/${SHORT_NAME}:${VERSION}
POD := manifests/deis-slugbuilder.yaml
SEC := manifests/deis-store-secret.yaml

all: build docker-build docker-push

build:
	mkdir -p ${BINDIR}
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -a -installsuffix cgo -ldflags '-s' -o $(BINDIR)/boot boot.go || exit 1

docker-build:
	docker build --rm -t ${IMAGE} rootfs
	# These are both YAML specific
	# perl -pi -e "s|image: [a-z0-9.:]+\/deis\/${SHORT_NAME}:[0-9a-z-.]+|image: ${IMAGE}|g" ${RC}
	# perl -pi -e "s|release: [a-zA-Z0-9.+_-]+|release: ${VERSION}|g" ${RC}

docker-push:
	docker push ${IMAGE}

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
	- kubectl create -f manifests/deis-minio-secretUser.yaml

kube-clean:
	- kubectl delete rc deis-${SHORT_NAME}-rc

kube-mc:
	kubectl create -f manifests/deis-mc-pod.yaml

mc:
	docker build -t ${DEIS_REGISTRY}/deis/minio-mc:latest mc
	docker push ${DEIS_REGISTRY}/deis/minio-mc:latest
	perl -pi -e "s|image: [a-z0-9.:]+\/|image: ${DEIS_REGISTRY}/|g" manifests/deis-mc-pod.yaml

.PHONY: all build docker-compile kube-up kube-down deploy mc kube-mc
