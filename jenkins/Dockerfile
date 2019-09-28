FROM jenkins/jenkins:2.197-slim
LABEL maintainer="javigs82@gmail.com" 

USER root

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

ARG DOCKER_CLIENT=docker-19.03.2.tgz 

# place docker client (DosD): nice approach
RUN cd /tmp/ \
&& curl -sSL -O https://download.docker.com/linux/static/stable/x86_64/${DOCKER_CLIENT} \
&& tar zxf ${DOCKER_CLIENT} \
&& mkdir -p /usr/local/bin \
&& mv ./docker/docker /usr/local/bin \
&& chmod +x /usr/local/bin/docker \
&& rm -rf /tmp/*


# Install Jenkins plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

#add user rights
# RUN groupadd --gid 999 docker && usermod -aG docker jenkins
# trick for vagrant which use vfbox as 999 and docker as 998
RUN groupadd --gid 998 docker && usermod -aG docker jenkins



USER jenkins
