FROM node:latest
RUN mkdir /build
ADD ./ /build
WORKDIR /build

RUN echo fuck you
RUN echo ${http_proxy}

RUN cd /build && \
	npm config set proxy ${http_proxy} --global && \
	npm install
