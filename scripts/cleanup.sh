#!/bin/bash

NAMESPACE=${1}
PREFIX=${2}

export K8S_RESOURCE_PREFIX="${2}"

envsubst < deploy.yaml | kubectl -n $NAMESPACE delete -f -
