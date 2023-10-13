#!/bin/bash

# apt -y install mmdb-bin -> 

# 1ère exécution du script d'installation ?
if [ ! -d /var/lib/simpleban ] ; then

	mkdir /var/lib/simpleban
	chown root:root /var/lib/simpleban
	chmod 750 /var/lib/simpleban

	# Installation dépendances
	apt-get -y install task-spooler sipcalc iptables ebtables sqlite3 host whois mmdb-bin

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
	postrotate

		# Debian 11
		/usr/lib/rsyslog/rsyslog-rotate

		# Ubuntu 16.04
		# invoke-rc.d rsyslog rotate >/dev/null 2>&1 || true

		# Ubuntu 14.04
		# reload rsyslog >/dev/null 2>&1 || true
		
	endscript
}
EOF

fi

# Programme
[ -d /opt/simpleban ] || mkdir /opt/simpleban
cp bin/* /opt/simpleban
chmod 750 /opt/simpleban
chmod 750 /opt/simpleban/*
ln -fs /opt/simpleban/sban /usr/local/sbin/sban

# Configuration
[ -d /etc/simpleban ] || mkdir /etc/simpleban
cp -r etc/* /etc/simpleban
[ -f /etc/simpleban/sban.cf ] || cp /etc/simpleban/sban.cf.dist /etc/simpleban/sban.cf

chown -R root:root /etc/simpleban
find /etc/simpleban/ -type f -exec chmod 640 {} \;
find /etc/simpleban/ -type d -exec chmod 750 {} \;

# Démarrage
cat<<EOF

* Pour automatiser le démarrage de "Simpleban":
cp /opt/simpleban/sban /etc/init.d
update-rc.d -f sban defaults

* Pour automatiser la purge automatique de la base de données:
ln -s /opt/simpleban/sban-vacuum /etc/cron.daily
Editer la variable 'PRUNE_DB' dans '/etc/sban/sban.cf' pour ajuster la durée de rétention.

EOF

