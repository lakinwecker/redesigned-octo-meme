FROM golang:1.22 AS builder

WORKDIR /app
COPY go.* ./

RUN go mod download
COPY *.go ./

RUN CGO_ENABLED=0 go build -o /hello_go_http

# Create a new release build stage
FROM alpine:latest

# Set the working directory to the root directory path
WORKDIR /

# Copy over the binary built from the previous stage
COPY --from=builder /hello_go_http /hello_go_http
EXPOSE 8080
ENTRYPOINT ["/hello_go_http"]
