FROM node:latest
RUN mkdir /build
ADD ./ /build
WORKDIR /build

echo ${http_proxy}

RUN cd /build && \
	npm config set proxy ${http_proxy} --global && \
	npm install
