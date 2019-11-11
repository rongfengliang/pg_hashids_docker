FROM postgres:11.2
ENV PG_HASHIDS=v1.2.1
LABEL EMAIL="1141591465@qq.com"
LABEL AUTHOR="dalongrong"

RUN buildDependencies="curl build-essential ca-certificates git  pkg-config  postgresql-server-dev-$PG_MAJOR" \
  && apt-get update \
  && apt-get install -y --no-install-recommends libc++1 ${buildDependencies} \
  && mkdir -p /tmp/build \
  && cd /tmp/build \
  && git clone https://github.com/iCyberon/pg_hashids.git /tmp/build/pg_hashids \
  && cd /tmp/build/pg_hashids \
  && make && make install \
  && cd / \
  && apt-get clean \
  && apt-get remove -y ${buildDependencies} \
  && apt-get autoremove -y \
  && rm -rf /tmp/build /var/lib/apt/lists/*