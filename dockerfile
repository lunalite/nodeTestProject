FROM node:latest
ENV proxy http://webproxy.merck.com:8080
RUN mkdir /build
ADD ./ /build
WORKDIR /build

RUN cd /build && \
	npm config set proxy ${http_proxy} --global && \
	npm install
