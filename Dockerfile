FROM alpine:3.13.5 AS builder
WORKDIR /tmp
RUN apk --update add alpine-sdk openssl openssl-dev zlib-dev \
    && git clone https://github.com/giltene/wrk2.git \
    && cd wrk2 \
    && make 

FROM alpine:3.13.5
LABEL description="Wrk2 HTTP benchmarking tool personal wrapper"
WORKDIR /data
RUN apk add --no-cache libstdc++ libc6-compat
COPY --from=builder /tmp/wrk2/wrk /usr/bin
ENTRYPOINT ["/usr/bin/wrk"]
