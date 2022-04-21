#!/bin/bash

set -e

if [[ -z "GITHUB_API_ENDPOINT" ]]; then
    GITHUB_API_ENDPOINT="https://api.github.com"
fi

LAST_VERSION=$(curl -s https://${GITHUB_API_ENDPOINT}/repos/${GITHUB_REPOSITORY}/releases/latest | jq -r ".tag_name")

echo "Last repository version: ${LAST_VERSION}"
echo "LAST_VERSION=${LAST_VERSION}" >> $GITHUB_ENV

