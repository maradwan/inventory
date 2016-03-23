#!/bin/bash
#install facter sudo apt-get install facter
path1=/tmp/hw_inventory.log
path2=/tmp/sw_inventory.log
ip_elasticsearch_port=127.0.0.1:9200
facter -j > $path1
dpkg-query --show --showformat='${Package}-${Version},\n' | sed  '1 i\{"Packages":"' | sed  "\$a"\"} > $path2
curl -X PUT http://${ip_elasticsearch_port}/hardware/$(hostname)/1 -d @${path1}
curl -X PUT http://${ip_elasticsearch_port}/software/$(hostname)/1 -d @${path2}
