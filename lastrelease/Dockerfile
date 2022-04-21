FROM alpine:3.12

LABEL "name"="Github Latest Release Lookup"
LABEL "maintainer"="Will Hattingh <nitecon@gmail.com>"
LABEL "version"="0.1.0"

LABEL "com.github.actions.name"="Github Latest Release Lookup"
LABEL "com.github.actions.description"="Provides a means to lookup the most recent release of the repository and adds it to environment variable $LAST_RELEASE"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="#E0EBF5"

RUN apk --no-cache add coreutils ca-certificates && update-ca-certificates && apk --no-cache add jq curl git

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]