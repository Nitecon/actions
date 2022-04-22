#!/bin/bash

set -e

if [[ ! -f ".VERSION" ]]; then
  echo "Make sure semantic-version already ran to create .VERSION file"
  exit 1
fi

APP_VERSION=$(cat .VERSION)


if [[ -z "$APP_VERSION" ]]; then
  echo "Make sure to run uses: gittools/actions/gitversion/execute@v0.9.7 before this"
  exit 1
fi

echo "Setting up for application version: ${APP_VERSION}"
BUILD_PATH=${GITHUB_WORKSPACE}/.build
mkdir -p ${BUILD_PATH}

GO111MODULE=on GOOS=linux GOARCH=amd64 go build -ldflags "-s -w -X main.version=${APP_VERSION}" -o ${GITHUB_WORKSPACE}/.build/bin/${APP_NAME} cmd/main.go
cd .build/ && zip -r ${APP_NAME}.zip ./*

echo "Build is complete"
ls -al .build/
