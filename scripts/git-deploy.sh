#!/bin/bash

set -e

# main
# refresh tags, including deployments and releases
git fetch --prune origin "+refs/tags/*:refs/tags/*" \
  && git fetch --tags --all \

# force tag
for stage in $@; do
  git tag "$stage" -f
done

# force push
git push --tags -f
