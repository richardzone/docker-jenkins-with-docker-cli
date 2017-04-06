FROM jenkins:2.46.1
# install the docker CLI because we would like it to be used by Jenkins master
USER root
RUN apt-get update && \
    apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/debian \
      $(lsb_release -cs) \
      stable" && \
    apt-get update && \
    apt-get install -y docker-ce=17.03.1~ce-0~debian-jessie && \
    usermod -aG docker jenkins
    
#RUN curl -L https://download.docker.com/linux/debian/dists/jessie/pool/stable/amd64/docker-ce_17.03.1\~ce-0\~debian-jessie_amd64.deb -o /tmp/docker-17-3-1.deb && \
#    dpkg -i /tmp/docker-17-3-1.deb && \
#    groupadd docker && \
#    usermod -aG docker jenkins

# drop back to the regular jenkins user - good practice
USER jenkins
