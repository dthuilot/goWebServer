# Dockerfile
FROM golang:1.16.3-buster AS builder
WORKDIR /app
COPY cmd/ go.mod go.sum ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -o app .

FROM alpine:3.15

RUN apk update \
	&& apk add ca-certificates tzdata \
	&& update-ca-certificates \
	&& apk add shadow \
	&& groupadd -r app \
	&& useradd -r -g app -s /sbin/nologin -c "Docker image user" app

USER app
WORKDIR /app

COPY --from=builder /app/app ./app
EXPOSE 8080
CMD ["./app"]