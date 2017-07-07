"sban" (SimpleBan) est une alternative à "fail2ban".

Ce script est écrit en shell Bash, et offre ces fonctionnalités:
- "KISS" => simple à configurer, facile à utiliser,
- conçu pour être nativement compatible IPv4 ET IPv6,
- mode test / debug,
- liste blanche IPv4 / IPv6,
- n'a pas besoin d'une base de données,
- peut exécuter plusieurs filtres sur différents fichiers de logs,
- peut exécuter plusieurs filtres sur un même fichier de log.

Prérequis:
- Le script est écrit sur Ubuntu 14.04 LTS server, mais il peut être
  adapté facilement pour d'autres distributions (et "pf" / FreeBSD ?):
- "Task-Spooler" (ts/tsp): "sérialisation" des appels Netfilter
- "Logtail": parcours des logs,
- "GNU Grep": motifs de recherche,
- "GNU Sed": motifs d'extraction des adresses IPv4 / IPv6,
- "CRON": exécution périodique de "sban",
- "AT": suppression des règles de blocage Netfilter.

Lien: https://dokuwicri.univ-reims.fr/wiki/doku.php?id=public:projets:simpleban:start
Mail: laurent DOT spagnol AT univ-reims DOT fr

########################################################################

"sban" (SimpleBan) is an alternative to "fail2ban".

This script is written in Bash shell, and offer these features:
- "Keep It Stupid Simple" => easy to configure, easy to use,
- designed to be natively compatible with IPv4 AND IPv6,
- test / debug mode,
- IPv4 / IPv6 whitelist,
- doesn't need a database,
- can run several filter on several log files,
- can run several filters on the same log file.

Prerequisites:
- Written on Ubuntu 14.04 LTS server, but may run on other distros (and
  "pf" / FreeBSD ?)!
- "Task-Spooler" (ts/tsp): serialized calls to Netfilter,
- "Logtail": parse logs,
- "GNU Grep": search patterns,
- "GNU Sed": extract IPv4 / IPv6 address,
- "CRON": periodic run of "sban",
- "AT": deletion of netfilter rules.

Link: https://dokuwicri.univ-reims.fr/wiki/doku.php?id=public:projets:simpleban:start
Mail: laurent DOT spagnol AT univ-reims DOT fr
