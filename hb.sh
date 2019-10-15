sudo echo 'export harborip='$(curl -H "Metadata-Flavor: Google" http://metadata/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip)'' >> ~/.bash_profile
source ~/.bash_profile
sudo systemctl  stop firewalld && sudo systemctl  stop firewalld
sudo curl -fsSL https://get.docker.com -o docker.sh
sudo chmod 777 *.sh
sudo sh docker.sh
sudo yum update -y
sudo usermod -aG docker root
sudo yum install wget tar -y
sudo systemctl  restart  docker && sudo systemctl  enable docker
sudo yum install epel-release  python-pip -y
sudo pip install docker-compose
sudo yum update python*
sudo docker-compose  -v
sudo wget -P /opt/ https://storage.googleapis.com/harbor-releases/release-1.9.0/harbor-online-installer-v1.9.0.tgz
sudo tar -xvf /opt/harbor-online*  -C /opt/
sudo sed -i 's/hostname: reg.mydomain.com/hostname: $harborip/g'   /opt/harbor/harbor.yml
sudo  sh  /opt/harbor/install.sh --with-clair
