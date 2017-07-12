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
