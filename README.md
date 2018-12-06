# Docker for SBT

Entrypoint is `sbt` command. Working directory is `/app`.

```sh
docker run -it --rm \
  -v </abs/path/to/your/build.sbt/dir>:/app \
  ornew/sbt <sbt command args>
```

It cache into `/app` directory.

