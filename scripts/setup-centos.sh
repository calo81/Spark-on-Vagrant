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

echo "setup centos"

disableFirewall
