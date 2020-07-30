#!/bin/bash

set -e

APP=serverless

if [[ ! -z "${IMAGE}" ]]; then
  APP=${IMAGE}
fi

# parsing arguments
while getopts 'n:y:v:?h' flag; do
  case $flag in
    y) YARN_VERSION=$OPTARG;;
    n) NODE_VERSION=$OPTARG;;
    v) VERSION=$OPTARG;;
    h|?) echo "Usage: $0 -v <VERSION (1.0.0)> -y <YARN_VESRION (v1.22.4)> -n <NODE_VERSION (12.18.0)>" && exit 2;;
  esac
done

docker build -t ${APP}:${VERSION} \
  --no-cache \
  --build-arg YARN_VERSION=${YARN_VERSION} \
  --build-arg NODE_VERSION=${NODE_VERSION} \
  .

echo "push command: \"docker push ${APP}:${VERSION}\""
