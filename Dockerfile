FROM alpine AS installer

ARG SBT_VERSION=1.2.6
ARG SBT_ARCHIVE_NAME=sbt-${SBT_VERSION}
ARG SBT_DOWNLOAD_URL=https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/${SBT_ARCHIVE_NAME}.tgz

RUN apk add --no-cache wget ca-certificates \
 && mkdir -p /tmp \
 && wget -qO - ${SBT_DOWNLOAD_URL} | tar -xz -C /tmp

FROM openjdk:jre-alpine

ENV SBT_HOME /opt/sbt
ENV PATH $SBT_HOME/bin:$PATH

COPY --from=installer /tmp/sbt $SBT_HOME
RUN apk add --no-cache bash

WORKDIR /app
ENTRYPOINT [ \
  "/opt/sbt/bin/sbt", \
  "-Dsbt.global.base=/app/.sbt/1.0", \
  "-Dsbt.boot.directory=/app/.sbt/boot", \
  "-Dsbt.ivy.home=/app/.ivy2", \
  "-Dsbt.repository.config=/app/.sbt/repositories" \
]
