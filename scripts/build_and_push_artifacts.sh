#!/bin/bash

if [ ! -d "./dist" ]; then
	mkdir ./dist
fi

IMAGELIST=$(grep image deploy.yaml | sed -E 's/\s+-\ image:\ //g')

for image in $IMAGELIST; do
	image_safe="${image//[^[:alnum:]]/-}"
	docker pull $image
	docker save $image > ./dist/${image_safe}.tar
done

envsubst < deploy.yaml > ./dist/deploy.yaml

artifactname="${SEMAPHORE_GIT_REPO_NAME}-${SEMAPHORE_GIT_TAG_NAME}.tar.gz"

tar cfz ${artifactname} ./dist

artifact push job ${artifactname}
