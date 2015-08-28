#!/bin/bash
source "/vagrant/scripts/common.sh"

function installLocalAnaconda {
	echo "install anaconda from local file"
	FILE=/vagrant/resources/$ANACONDA_ARCHIVE
	bash $FILE -b -p /usr/local/anaconda3
}

function installRemoteAnaconda {
	echo "install anaconda from remote file"
	curl -o /vagrant/resources/$ANACONDA_ARCHIVE -O -L $ANACONDA_MIRROR_DOWNLOAD
  FILE=/vagrant/resources/$ANACONDA_ARCHIVE
  bash $FILE -b -p /usr/local/anaconda3
}

function installAnaconda {
	if resourceExists $ANACONDA_ARCHIVE; then
		installLocalAnaconda
	else
		installRemoteAnaconda
	fi
}

function setupAnaconda {
  echo "setting up anaconda"
  ln -s /usr/local/anaconda3 /usr/local/anaconda
}

function setupEnvVars {
  echo "creating anaconda environment variables"
  echo export ANACONDA_HOME=/usr/local/anaconda >> /etc/profile.d/anaconda.sh
  echo export PATH=\${ANACONDA_HOME}/bin:\${PATH} >> /etc/profile.d/anaconda.sh
}

echo "setup anaconda"

installAnaconda
setupAnaconda
setupEnvVars

