# Build stage
FROM golang:1.14-alpine as builder

WORKDIR /src
COPY main.go .

RUN go build -o /app/main -v ./main.go

# Final stage
FROM alpine:3.12

WORKDIR /app
COPY --from=builder /app .

CMD [ "./main" ]

EXPOSE 8080