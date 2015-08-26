#!/bin/bash
source "/vagrant/scripts/common.sh"

function formatNameNode {
	$HADOOP_PREFIX/bin/hdfs namenode -format myhadoop -force -noninteractive
	echo "formatted namenode"
}

formatNameNode
