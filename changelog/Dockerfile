FROM golang:latest

LABEL "name"="Changelog Builder"
LABEL "maintainer"="Will Hattingh <nitecon@gmail.com>"
LABEL "version"="0.1.0"

LABEL "com.github.actions.name"="Changelog Builder"
LABEL "com.github.actions.description"="Creates a generic changelog for applications prior to release"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="#E0EBF5"

RUN \
  apt-get update && \
  apt-get install -y ca-certificates openssl git && \
  update-ca-certificates && \
  rm -rf /var/lib/apt

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]