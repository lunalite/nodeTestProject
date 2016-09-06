FROM node:latest
RUN mkdir /build
ADD ./ /build
WORKDIR /build

RUN cd /build && \
	npm config set proxy ${HTTP_PROXY} --global && \
	npm install
