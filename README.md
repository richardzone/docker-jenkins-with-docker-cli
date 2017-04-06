# Dockerized Jenkins with Docker support

This docker image contains [Jenkins](https://github.com/jenkinsci/docker) 2.46.1 with built-in docker cli inside the image, so that you can use docker related commands in Jenkins builds (e.g. to launch new containers), or you can use plugins like [Docker Slaves Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Docker+Slaves+Plugin)

## How to use this

Use the below command to start Jenkins container:

```sh
docker run --name myjenkins -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /var/jenkins_home jenkins
```

Note that in above command we expose the Docker socket in host machine to the Jenkins CI container, so that it could launch sibling containers. For more info, please see [here](https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/).

## License

[WTFPL](http://wtfpl2.com/)
