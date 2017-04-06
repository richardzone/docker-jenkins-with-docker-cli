FROM jenkins:2.46.1
# install the docker CLI because we would like it to be used by Jenkins master
USER root
RUN curl -L https://download.docker.com/linux/debian/dists/jessie/pool/stable/amd64/docker-ce_17.03.1\~ce-0\~debian-jessie_amd64.deb -o /tmp/docker-17-3-1.deb && \
    dpkg -i /tmp/docker-17-3-1.deb && \
    groupadd docker && \
    usermod -aG docker jenkins
# drop back to the regular jenkins user - good practice
USER jenkins
