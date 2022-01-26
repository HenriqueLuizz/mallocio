FROM alpine:3.14

ENV DIST=both

WORKDIR /project

# Install packages
# RUN apt-get update -y && apt-get install -y \
#     make \
#     g++ \
#     g++-mingw-w64 \
#     zip \
#     unzip \
#     tar 
RUN apk add --no-cache mingw-w64-gcc \
    make \
    g++ \
    zip \
    tar

# Copy files
COPY . /project

RUN mkdir -p /project/build
COPY ./src/teste.txt /project/build/teste.txt

# Volume
VOLUME [ "/project" ]

# Build
CMD make ${DIST}

