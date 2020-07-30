#!/bin/bash

set -e

PATH=/root/.serverless/bin:$PATH

serverless deploy --stage $STAGE --region $AWS_REGION
