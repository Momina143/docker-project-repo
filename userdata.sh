#!/bin/bash
dnf update -y
dnf install docker -y
dnf install git -y
systemctl start docker
systemctl enable docker
newgrp docker
usermod -aG docker ec2-user
curl -SL https://github.com/docker/compose/releases/download/v2.32.4/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
TOKEN=${user-data-git-token}
USER=${user-data-git-username}
git clone https://$TOKEN@github.com/$USER/docker-files-repository
cd docker-files-repository
docker build -t bookstore:latest .
docker-compose up -d