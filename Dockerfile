FROM alpine:3.14

ENV DIST=both

WORKDIR /project

RUN apk add --no-cache mingw-w64-gcc \
    make \
    g++ \
    zip \
    tar \
    samba-client

# Copy files
COPY . /project

RUN mkdir -p /project/build
COPY ./src/teste.txt /project/build/teste.txt

# Volume
VOLUME [ "/project" ]

# Build
CMD make ${DIST}

