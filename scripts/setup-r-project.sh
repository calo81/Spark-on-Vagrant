#!/bin/bash
source "/vagrant/scripts/common.sh"

function installR {
  echo "install R"
  yum -y install R
  # NOTE: In order to install R using yum, the elpo repository 
  # should already be installed. In our case that means that
  # the script setup-centos.sh should run first
  yum -y install R

  # Install libraries that are necessary for the IRkernel to
  # work
  yum -y install libcurl libcurl-devel
  yum -y install libxml2 libxml2-devel
  yum -y install openssl-devel
  yum -y install zeromq
  yum -y install zeromq-devel
  # Nasty workaround in order to be able to install rzmq (https://github.com/IRkernel/IRkernel/issues/50)
  curl -o /usr/local/include/zmq.hpp https://raw.githubusercontent.com/zeromq/cppzmq/master/zmq.hpp
}

function setupR {
  echo "setting up R (this may take a while)"
  mkdir /home/vagrant/RPackages
  chown vagrant /home/vagrant/RPackages
  cp -f /vagrant/resources/r-project/.Renviron /home/vagrant
  cp -f /vagrant/resources/r-project/.RProfile /home/vagrant

  # Install IRkernel for Jupyter/iPython
  R CMD BATCH /vagrant/resources/r-project/installIRKernel.R
  rm  installIRKernel.Rout
}

function setupEnvVars {
  echo "creating R environment variables"
  echo export LANG=en_US.UTF-8 >> /etc/profile.d/r-project.sh
  echo export LC_ALL=en_US.UTF-8 >> /etc/profile.d/r-project.sh
}

echo "setup R"

installR
setupR
setupEnvVars

