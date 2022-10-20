#!/bin/bash

artifactpath="${SEMAPHORE_GIT_REPO_NAME}-${SEMAPHORE_GIT_TAG_NAME}"

if [ ! -d "${artifactpath}" ]; then
	mkdir ./${artifactpath}
fi

IMAGELIST=$(grep image deploy.yaml | sed -E 's/\s+-\ image:\ //g')

for image in $IMAGELIST; do
	image_safe="${image//[^[:alnum:]]/-}"
	docker pull $image
	docker save $image > ./${artifactpath}/${image_safe}.tar
done

envsubst < deploy.yaml > ./${artifactpath}/deploy.yaml


tar cfz ${artifactpath}.tar.gz ${artifactpath}

artifact push job ${artifactpath}.tar.gz
