# sshd
#
# VERSION               0.0.1

FROM ubuntu:14.04
MAINTAINER Hiroomi Taniguchi <hiroomi.taniguchi@gmail.com>

RUN apt-get update

# install sshd
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# install chef
RUN apt-get install -y curl
RUN curl -L https://www.opscode.com/chef/install.sh | bash
RUN /opt/chef/embedded/bin/gem install knife-solo -no-ri -no-rdoc
RUN useradd -d /home/docker -m -s /bin/bash docker
RUN echo docker:docker | chpasswd
RUN echo 'docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

