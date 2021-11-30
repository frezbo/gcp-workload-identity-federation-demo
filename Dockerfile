FROM --platform=${BUILDPLATFORM:-linux/amd64} golang@sha256:6556ce40115451e40d6afbc12658567906c9250b0fda250302dffbee9d529987 AS builder

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG TARGETOS
ARG TARGETARCH

ENV GO111MODULE=on
ENV CGO_ENABLED=0

COPY go.* .
RUN go mod download

COPY . .
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o app .

FROM scratch
# add ca certificates from builder image
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=builder /app /app
USER 1000
ENTRYPOINT ["/app"]
