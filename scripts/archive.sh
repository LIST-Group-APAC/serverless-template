#!/bin/bash

set -e

zip -FS -q -r -y artifact.zip \
  handler.js \
  package.json \
  node_modules
