#!/bin/bash

set -e

if [[ -z "$APP_NAME" ]]; then
  echo "Set the APP_VERSION env variable."
  exit 1
fi
if [[ ! -f "./git-version" ]]; then
  echo "Make sure to run codacy/git-version@2.2.0 prior to this"
  exit 1
fi

APP_VERSION=$(./git-version)
echo "Setting up for application version: ${APP_VERSION}"
BUILD_PATH=${GITHUB_WORKSPACE}/.build
mkdir -p ${BUILD_PATH}

GO111MODULE=on GOOS=linux GOARCH=amd64 go build -ldflags "-s -w -X main.version=${APP_VERSION}" -o ${GITHUB_WORKSPACE}/.build/bin/${APP_NAME} cmd/main.go
cd .build/ && zip -r ${APP_NAME}.zip ./*

echo "Build is complete"
ls -al .build/
