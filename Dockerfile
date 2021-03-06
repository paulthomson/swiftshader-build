FROM ubuntu:14.04

RUN \
  apt-get update && \
  apt-get -y install \
    cmake g++ make libx11-dev libxext-dev \
    git golang wget zip && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV \
  GOPATH=/data/gopath \
  PATH=/data/gopath/bin:${PATH}

RUN \
  mkdir -p ${GOPATH} && \
  go get github.com/c4milo/github-release

COPY . /data/

WORKDIR /data

CMD ["bash"]

