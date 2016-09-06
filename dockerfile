FROM node:latest
ENV proxy ${http_proxy}
RUN mkdir /build
ADD ./ /build
WORKDIR /build

RUN cd /build && \
	npm config set proxy ${http_proxy} --global && \
	npm install
