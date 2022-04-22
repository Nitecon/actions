#!/bin/bash

set -e

if [[ ! -f release_info.txt ]]; then
  echo "you must dump the output from semver-release into a file in the root called release_info.txt"
  exit 1
fi
APP_SEMVER=$(cat release_info.txt|grep -v "###"|grep "#" |sed -e 's/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/')

echo "Setting up for application version: ${APP_SEMVER}"
BUILD_PATH=${GITHUB_WORKSPACE}/.build
mkdir -p ${BUILD_PATH}

GO111MODULE=on GOOS=linux GOARCH=amd64 go build -ldflags "-s -w -X main.version=${APP_SEMVER}" -o ${GITHUB_WORKSPACE}/.build/bin/${APP_NAME} cmd/main.go
cd .build/ && zip -r ${APP_NAME}.zip ./*

echo "Build is complete"
ls -al .build/
