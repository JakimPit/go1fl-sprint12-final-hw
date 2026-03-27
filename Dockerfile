FROM golang:1.25 AS builder
WORKDIR /app
COPY . .
RUN go mod tidy && go build -o parcel-tracker .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /app/parcel-tracker .
CMD ["./parcel-tracker"]