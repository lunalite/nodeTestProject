FROM node:latest
ARG WORKSPACE

RUN mkdir -p $WORKSPACE
ADD ./ $WORKSPACE
WORKDIR $WORKSPACE

RUN cd $WORKSPACE && \
        npm config set proxy ${http_proxy} --global && \
        npm install

RUN chmod +x ./scripts/docker_command.sh	
