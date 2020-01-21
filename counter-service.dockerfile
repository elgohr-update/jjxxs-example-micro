FROM obraun/vss-micro-jenkins as builder
COPY . /app
WORKDIR /app
RUN go build -o counter-service/counter-service counter-service/main.go

FROM alpine
COPY --from=builder /app/counter-service/counter-service /app/counter-service
EXPOSE 8091
ENTRYPOINT [ "/app/counter-service" ]