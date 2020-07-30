#!/bin/bash

set -e

serverless deploy --stage $STAGE
