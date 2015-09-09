#!/bin/bash
source "/vagrant/scripts/common.sh"

function installLocalScala {
	echo "installing scala"
	FILE=/vagrant/resources/$SCALA_ARCHIVE
	tar -xvf $FILE -C /usr/local
}

function installRemoteScala {
	echo "install scala"
  curl -o /vagrant/resources/$SCALA_ARCHIVE -O -L  $SCALA_MIRROR_DOWNLOAD
  FILE=/vagrant/resources/$SCALA_ARCHIVE
	tar -xvf $FILE -C /usr/local
}

function setupScala {
	echo "setting up scala"
		ln -s /usr/local/$SCALA_VERSION /usr/local/scala
}

function setupEnvVars {
	echo "creating scala environment variables"
	echo export SCALA_HOME=/usr/local/scala >> /etc/profile.d/scala.sh
	echo export PATH=\${SCALA_HOME}/bin:\${PATH} >> /etc/profile.d/scala.sh
}

function installsbt {
  curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo
  yum install -y sbt
}

function installScala {
	if resourceExists $SCALA_ARCHIVE; then
		installLocalScala
	else
		installRemoteScala
	fi
}

echo "setup java"
installScala
setupScala
setupEnvVars
installsbt

