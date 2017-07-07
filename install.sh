#!/bin/bash

# 1ère exécution du script d'installation ?
if [ ! -d /var/lib/simpleban ] ; then

	mkdir /var/lib/simpleban
	chown root:root /var/lib/simpleban
	chmod 750 /var/lib/simpleban

	# Installation dépendances
	apt-get -y install task-spooler sipcalc iptables sqlite host whois

	# Configuration syslog
	sed -i 's/\(^\)\($RepeatedMsgReduction\)\(.*\)/#\2\3\n$RepeatedMsgReduction off/g' /etc/rsyslog.conf
	cat<<EOF>/etc/rsyslog.d/99-sban.conf
if \$syslogtag == 'sban:' then -/var/log/sban.log
EOF
	service rsyslog restart

	# Configuration logrotate
	cat<<EOF>/etc/logrotate.d/sban
/var/log/sban.log
{
	rotate 30
	daily
	dateext
	missingok
	notifempty
	compress
	delaycompress
	sharedscripts
	postrotate
		invoke-rc.d rsyslog rotate > /dev/null
	endscript
}
EOF

fi

# Programme
[ -d /usr/local/simpleban ] || mkdir /usr/local/simpleban
cp bin/* /usr/local/simpleban
chmod 750 /usr/local/simpleban
chmod 750 /usr/local/simpleban/*
ln -fs /usr/local/simpleban/sban /usr/local/sbin/sban

# Configuration
[ -d /etc/simpleban ] || mkdir /etc/simpleban
cp -r etc/* /etc/simpleban
[ -f /etc/simpleban/sban.cf ] || cp /etc/simpleban/sban.cf.dist /etc/simpleban/sban.cf

chown -R root:root /etc/simpleban
find /etc/simpleban/ -type f -exec chmod 640 {} \;
find /etc/simpleban/ -type d -exec chmod 750 {} \;

# Démarrage
cp /usr/local/simpleban/sban /etc/init.d
if [ ! -d /var/lib/simpleban ] ; then
	update-rc.d -f sban defaults
fi
