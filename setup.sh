#!/bin/bash

cp bintray-apache-couchdb-rpm.repo /etc/yum.repos.d/bintray-apache-couchdb-rpm.repo

yum install couchdb-2.3.1

sed -i "s/enabled=1/enabled=0/g" /etc/yum.repos.d/bintray-apache-couchdb-rpm.repo

mkdir -p /etc/kazoo

cp couchdb /etc/kazoo -r

cp system/logrotate.d/couchdb.conf /etc/logrotate.d/

cp system/sbin/* /usr/sbin/

chmod +x /usr/sbin/kazoo-couchdb 

chmod +x /usr/sbin/kazoo-run-couchdb 

cp system/security/limits.d/couchdb.limits.conf /etc/security/limits.d/


cp system/systemd/kazoo-couchdb.service /usr/lib/systemd/system/


systemctl enable kazoo-couchdb

echo "You may now start couchdb with systemctl start kazoo-couchdb"
echo ""
echo "Default configuration is for 1 couchdb instance you should edit before starting for a cluster"
echo "Open config file with Nano?"
read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi
nano /etc/kazoo/couchdb/local.ini
