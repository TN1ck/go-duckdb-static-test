# Mostly inspired by
# https://docs.docker.com/language/golang/build-images/

##
## Build
##

FROM golang:1.21-bullseye AS build


WORKDIR /app
COPY go.mod ./
COPY go.sum ./
RUN go mod download
COPY main.go ./
RUN go build -o /go/bin/main ./main.go

##
## Deploy
##

# FAIL: Does not work as it lacks libstdc++.so.6, libm.so.6, libgcc_s.so.1, glibc etc
FROM gcr.io/distroless/base-debian10
# FROM golang:1.21-bullseye (this will work)

WORKDIR /
COPY --from=build /go/bin/main /main
# Not needed for the bullseye image
USER nonroot:nonroot
CMD ["/main"]
