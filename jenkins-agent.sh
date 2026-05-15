#!/bin/bash

#resize disk from 20GB to 50GB
# growpart /dev/nvme0n1 4
# lvextend -L +10G /dev/mapper/RootVG-homeVol
# lvextend -L +10G /dev/mapper/RootVG-varVol
# lvextend -l +100%FREE /dev/mapper/RootVG-varTmpVol
# xfs_growfs /home
# xfs_growfs /var/tmp
# xfs_growfs /var

# RHEL-9-DevOps-Practice
# t3.micro
# allow-everything
# 50 GB
#resize disk from 20GB to 50GB
lsblk 
sudo growpart /dev/nvme0n1 4  #t3.micro used only
sudo lvextend -l +50%FREE /dev/RootVG/rootVol 
sudo lvextend -l +50%FREE /dev/RootVG/varVol 
sudo xfs_growfs / 
sudo xfs_growfs /var 
echo "*************   resize the volume - completed *************"


yum install java-21-openjdk -y
alternatives --set java /usr/lib/jvm/java-21-openjdk/bin/java
java --version
echo "***************** Java-21 installation completed************"


yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform
echo "*************   terraform installation - completed *************"

dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
echo "*************   nodejs installation - completed *************"

yum install zip -y
echo "*************   zip installation - completed *************"

# docker
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user
echo "*************   docker installation - completed *************"

# Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
echo "*************   helm installation - completed *************"

# Maven for Java projects
dnf install maven -y
echo "*************   maven installation - completed *************"

# Python for python projects
dnf install python3.11 gcc python3-devel -y
echo "*************   python installation - completed *************"

curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.30.0/2024-05-12/bin/linux/amd64/kubectl 
sudo chmod +x ./kubectl 
sudo mv kubectl  /usr/local/bin/ 
kubectl version --client 
echo "*************   kubectl installation - completed *************"