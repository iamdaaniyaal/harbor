#!/bin/bash
export another=$(echo $tools)
export t1=$(echo $tools | sed "s/,/-/g")
export time=$(date +"%m%d%y%H%M%S")

echo $another
echo $t1
echo $time

for i in $(echo $another | sed "s/,/ /g")
do
  array+=( $i )
done

arraylength=${#array[@]}

for(( i=0; i<${arraylength}; i++))

do
  echo ${array[i]}
   
  if [[ ${array[i]} = "jenkins" ]];
  then   
    echo "we got jenkins";
    cd ~
    sudo rm -rf jenkins
    sudo  git clone https://github.com/iamdaaniyaal/jenkins.git
    sudo chmod 777 jenkins
    cd jenkins
    cp /home/sanem_ashokgoud/jenkins/test/lamp/credentials.json .
    sudo sed -i 's/tvalues/'$t1'/' terraform.tfvars
    sudo sed -i 's/tname/'$tool_name'/' terraform.tfvars
    sudo sed -i 's/ttype/'$tool'/' terraform.tfvars
    sudo sed -i 's/timestamp/'$time'/' terraform.tfvars
    terraform init
    terraform plan
    terraform apply --auto-approve    
  elif [[ ${array[i]} =  "sonarqube" ]];
  then
    cd ~  
    sudo rm -rf sonarqube
    sudo git clone https://github.com/iamdaaniyaal/sonarqube.git
    sudo chmod 777 sonarqube
    cd sonarqube
    cp /home/sanem_ashokgoud/jenkins/test/lamp/credentials.json .
    sudo sed -i 's/tvalues/'$t1'/' terraform.tfvars
    sudo sed -i 's/tname/'$tool_name'/' terraform.tfvars
    sudo sed -i 's/ttype/'$tool'/' terraform.tfvars
    sudo sed -i 's/timestamp/'$time'/' terraform.tfvars
    terraform init
    terraform plan
    terraform apply --auto-approve  
  elif  [[ ${array[i]} = "harbor" ]];
  then
    echo "we got harbor";
    cd ~
    sudo rm -rf harbor
    sudo  git clone https://github.com/iamdaaniyaal/harbor.git
    sudo chmod 777 harbor
    cd harbor   
    cp /home/sanem_ashokgoud/jenkins/test/lamp/credentials.json .
    sudo sed -i 's/tvalues/'$t1'/' terraform.tfvars
    sudo sed -i 's/tname/'$tool_name'/' terraform.tfvars
    sudo sed -i 's/ttype/'$tool'/' terraform.tfvars
    sudo sed -i 's/timestamp/'$time'/' terraform.tfvars 
    terraform init
    terraform plan
    terraform apply --auto-approve  
  elif  [[ ${array[i]} = "maven" ]];
  then
    echo "maven is here";
    cd ~
    sudo rm -rf maven
    sudo git clone https://github.com/iamdaaniyaal/maven.git
    sudo chmod 777 maven
    cd maven
    cp /home/sanem_ashokgoud/jenkins/test/lamp/credentials.json .
    sudo sed -i 's/tvalues/'$t1'/' terraform.tfvars
    sudo sed -i 's/tname/'$tool_name'/' terraform.tfvars
    sudo sed -i 's/ttype/'$tool'/' terraform.tfvars
    sudo sed -i 's/timestamp/'$time'/' terraform.tfvars
    terraform init
    terraform plan
    terraform apply --auto-approve  
  fi   
done
