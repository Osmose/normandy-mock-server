#!/usr/bin/env bash
BUILD_DIR="$(mktemp -d)"

/mock-server/bin/generate.py $BUILD_DIR

aws s3 rm --recursive "s3://$AWS_S3_BUCKET/"
aws s3 cp --recursive $BUILD_DIR "s3://$AWS_S3_BUCKET/" --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
