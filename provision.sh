#!/bin/sh
sudo apt-get update

# install docker
sudo apt-get install -y apt-transport-https ca-certificates
while :
do
    sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    if [ $? = 0 ]; then
        break;
    fi
done

sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get purge lxc-docker
sudo apt-cache policy docker-engine
sudo apt-get install -y linux-image-extra-$(uname -r)
sudo apt-get install -y apparmor
sudo apt-get install -y docker-engine
sudo service docker start
sudo usermod -aG docker vagrant

# install curl
sudo apt-get install -y curl

# install ssh-key
sudo -u vagrant ssh-keygen -t rsa -N '' -f /home/vagrant/.ssh/id_rsa
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa

# prepare log for fluentd
mkdir -p /data
chmod 777 /data
