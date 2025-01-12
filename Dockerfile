FROM gcc:latest AS gcc-builder

WORKDIR /home/app
COPY . ./
RUN gcc c/hello.c

FROM gcr.io/distroless/cc
COPY --from=gcc-builder /home/app/a.out /a.out

CMD ["./a.out"]