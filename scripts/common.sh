#!/bin/bash

#java
JAVA_ARCHIVE=jdk-7u51-linux-x64.gz

#scala
SCALA_VERSION=scala-2.10.7
SCALA_ARCHIVE=${SCALA_VERSION}.tgz
SCALA_MIRROR_DOWNLOAD=http://www.scala-lang.org/files/archive/${SCALA_VERSION}.tgz

#hadoop
HADOOP_PREFIX=/usr/local/hadoop
HADOOP_CONF=$HADOOP_PREFIX/etc/hadoop
HADOOP_VERSION=hadoop-2.6.2
HADOOP_ARCHIVE=$HADOOP_VERSION.tar.gz
HADOOP_MIRROR_DOWNLOAD=http://apache.mirror.anlx.net/hadoop/common/hadoop-2.6.2/hadoop-2.6.2.tar.gz
HADOOP_RES_DIR=/vagrant/resources/hadoop

#spark
SPARK_VERSION=spark-1.5.2
SPARK_ARCHIVE=$SPARK_VERSION-bin-hadoop2.6.tgz
SPARK_MIRROR_DOWNLOAD=http://www.apache.org/dist/spark/spark-1.5.2/spark-1.5.2-bin-hadoop2.6.tgz
SPARK_RES_DIR=/vagrant/resources/spark
SPARK_CONF_DIR=/usr/local/spark/conf

#ssh
SSH_RES_DIR=/vagrant/resources/ssh
RES_SSH_COPYID_ORIGINAL=$SSH_RES_DIR/ssh-copy-id.original
RES_SSH_COPYID_MODIFIED=$SSH_RES_DIR/ssh-copy-id.modified
RES_SSH_CONFIG=$SSH_RES_DIR/config

#Anaconda
ANACONDA_VERSION=Anaconda3-2.3.0
ANACONDA_ARCHIVE=$ANACONDA_VERSION-Linux-x86_64.sh
ANACONDA_MIRROR_DOWNLOAD=https://repo.continuum.io/archive/Anaconda3-2.3.0-Linux-x86_64.sh
ANACONDA_RES_DIR=/vagrant/resources/anaconda

function resourceExists {
	FILE=/vagrant/resources/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function fileExists {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

#echo "common loaded"
