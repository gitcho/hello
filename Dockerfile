FROM gcc:latest AS gcc-builder

WORKDIR /home/app
COPY . ./
RUN gcc c/hello.c -o /home/app/hello

FROM gcr.io/distroless/cc
COPY --from=gcc-builder /home/app/hello /hello

CMD ["./hello"]