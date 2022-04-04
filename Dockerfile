FROM debian:11.3-slim AS builder

ARG RELEASE=1.0.3
ENV RELEASE ${RELEASE}

# Install build essential 
RUN apt update && apt install -y build-essential git curl unzip

RUN curl https://codeload.github.com/domrod/redis-cluster-proxy/zip/refs/tags/${RELEASE} -o redis-cluster-proxy-${RELEASE}.zip

RUN unzip redis-cluster-proxy-${RELEASE}.zip

WORKDIR /redis-cluster-proxy-${RELEASE}

RUN make helgrind && make install

FROM debian:11.3-slim
COPY --from=builder /usr/local/bin/redis-cluster-proxy /usr/local/bin/
