#!/bin/bash

set -e

PATH=/root/.serverless/bin:$PATH

NODE_ENV=$STAGE

serverless deploy --stage $STAGE --region $AWS_REGION
