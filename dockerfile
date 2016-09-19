FROM node:latest
ENV http_proxy http://webproxy.merck.com:8080

RUN mkdir -p $WORKSPACE
ADD ./ $WORKSPACE
WORKDIR $WORKSPACE

RUN cd $WORKSPACE && \
        npm config set proxy ${http_proxy} --global && \
        npm install

RUN chmod +x ./scripts/docker_command.sh	
