FROM golang:1.18

LABEL "name"="Go Builder"
LABEL "maintainer"="Will Hattingh <nitecon@gmail.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Go Builder"
LABEL "com.github.actions.description"="Multi step compile & zip applications"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="#E0EBF5"

RUN apt-get update && apt-get install -y zip && rm -rf /var/lib/apt/lists/* 

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]