ARG BASE_IMAGE
FROM $BASE_IMAGE AS installer

FROM openjdk:jre-alpine

ENV SBT_HOME /opt/sbt
ENV PATH $SBT_HOME/bin:$PATH

COPY --from=installer /tmp/sbt $SBT_HOME
RUN apk add --no-cache bash libc6-compat

WORKDIR /app
ENTRYPOINT [ \
  "/opt/sbt/bin/sbt", \
  "-Dsbt.global.base=/app/.sbt/1.0", \
  "-Dsbt.boot.directory=/app/.sbt/boot", \
  "-Dsbt.ivy.home=/app/.ivy2", \
  "-Dsbt.repository.config=/app/.sbt/repositories" \
]

