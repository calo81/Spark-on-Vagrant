#!/bin/bash
source "/vagrant/scripts/common.sh"

function disableFirewall {
	echo "disabling firewall"

	#service iptables save
	#service iptables stop
	#chkconfig iptables off

  systemctl stop firewalld
  systemctl mask firewalld
  chkconfig firewalld off
}

function installEpelRepo {
# enable epel repo
  wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
  rpm -ivh epel-release-7-5.noarch.rpm

  # remove the rpm
  rm epel-release-7-5.noarch.rpm
}

function installSoftware {
  yum -y install vim
}

echo "setup centos"

disableFirewall
installEpelRepo
installSoftware

