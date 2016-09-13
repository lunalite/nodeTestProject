FROM node:latest
ENV http_proxy http://webproxy.merck.com:8080

RUN mkdir /var/lib/jenkins/workspace/nodeProject 
ADD ./ /var/lib/jenkins/workspace/nodeProject
WORKDIR /var/lib/jenkins/workspace/nodeProject

RUN cd /var/lib/jenkins/workspace/nodeProject && \
        npm config set proxy ${http_proxy} --global && \
        npm install

RUN chmod +x ./scripts/docker_command.sh	
