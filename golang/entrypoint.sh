#!/bin/bash

set -e

if [[ -z "$APP_SEMVER" ]]; then
  echo "Make sure semantic-version already ran and make sure a separate step is added that sets the envar like:"
  echo '      - name: Store App Version for future step use'
  echo '        run: export APP_SEMVER=$(cat .VERSION) && echo "::set-env name=APP_SEMVER::$APP_SEMVER"'
  exit 1
fi

echo "Setting up for application version: ${APP_SEMVER}"
BUILD_PATH=${GITHUB_WORKSPACE}/.build
mkdir -p ${BUILD_PATH}

GO111MODULE=on GOOS=linux GOARCH=amd64 go build -ldflags "-s -w -X main.version=${APP_SEMVER}" -o ${GITHUB_WORKSPACE}/.build/bin/${APP_NAME} cmd/main.go
cd .build/ && zip -r ${APP_NAME}.zip ./*

echo "Build is complete"
ls -al .build/
