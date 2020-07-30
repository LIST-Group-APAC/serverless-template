#!/bin/bash

set -e

export PATH=/root/.serverless/bin:$PATH

serverless deploy --stage $STAGE --region $AWS_REGION
