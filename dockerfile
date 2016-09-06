FROM node:latest
RUN mkdir /build
ADD ./ /build
WORKDIR /build

RUN cd /build && \
	npm config set http-proxy ${http_proxy} --global && \
	npm install
