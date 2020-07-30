#!/bin/bash

set -e

serverless deploy --stage $STAGE --region $AWS_REGION
