#!/bin/bash

set -e

PATH=/root/.serverless/bin:$PATH

serverless deploy
