**sban** (SimpleBan) est une alternative à **fail2ban**, nativement compatible IPv4 et IPv6.

## Fonctionnalités:
 * Ecrit en shell Bash
 * "KISS" => simple à configurer, facile à utiliser,
 * conçu pour être nativement compatible IPv4 ET IPv6,
 * mode test / debug,
 * listes blanches
   * adresses / réseaux IPv4 et IPv6,
   * hostnames, domaines (pour résolution inverse),
 * stockage des données dans une base SQLite,
 * analyse des logs "au fil de l'eau",
 * peut exécuter plusieurs filtres sur différents fichiers de logs,
 * peut exécuter plusieurs filtres sur un même fichier de log,
 * déclenchement sur "TRIGGERS" (nombre d'évènnements, période, durée du blocage),
 * un "trigger" peut contenir plusieurs périodes,
 * blocage possible de réseaux complets,
 * ...

## Prérequis:
Ce script a été écrit sur Ubuntu 14.04 LTS. Il fonctionne sur Ubuntu 16.04 LTS.
Le script d'installation ajoute les paquets nécessaires.

## Installation:
 * Télécharger les scripts: ``git clone https://github.com/lspagnol/simpleban2``
 * Installer les scripts: ``cd simpleban2 ; chmod +x install.sh ; ./install.sh``

## Configuration
* Editer le fichier **/etc/simpleban/sban.cf**
* Copiez / éditez les modèles de filtres: **/etc/simpleban/filters/**

Mail: laurent DOT spagnol AT univ-reims DOT fr


**SimpleBan** est une alternative à **fail2ban**, nativement compatible IPv4 et IPv6.

## Ce script est écrit en shell Bash et offre ces fonctionnalités:
 * **KISS** => simple à configurer, facile à utiliser,
 * conçu pour être nativement compatible IPv4 ET IPv6,
 * mode test / debug,
 * liste blanche IPv4 / IPv6,
 * peut exécuter plusieurs filtres sur différents fichiers de logs,
 * peut exécuter plusieurs filtres sur un même fichier de log.

## Prérequis:
 * Le script est écrit sur Ubuntu 14.04 LTS / 16.04 LTS mais il peut être
   adapté facilement à d'autres distributions (et "pf" / FreeBSD ?).
 * **Task-Spooler** (ts/tsp): "sérialisation" des appels Netfilter
 * **GNU Grep**: motifs de recherche,
 * **GNU Sed**: motifs d'extraction des adresses IPv4 / IPv6,
 * **CRON**: exécution périodique de "sban",
 * **AT**: suppression des règles de blocage Netfilter.

Mail: laurent DOT spagnol AT univ-reims DOT fr

########################################################################

"sban" (SimpleBan) is an alternative to "fail2ban".

This script is written in Bash shell and offer these features:
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

Mail: laurent DOT spagnol AT univ-reims DOT fr
