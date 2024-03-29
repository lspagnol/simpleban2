**sban** (SimpleBan) est une alternative à **fail2ban**, nativement compatible IPv4 et IPv6.

## Fonctionnalités:
 * Ecrit en shell Bash
 * "KISS" => simple à configurer, facile à utiliser,
 * nativement compatible IPv4 ET IPv6,
 * deux modes de filtrage:
   * L3 (par défaut) avec **iptables**
   * L2 avec **ebtables** (adapté aux hyperviseurs)
 * blocage possible de réseaux complets,
 * mode test / debug,
 * listes blanches
   * adresses / réseaux IPv4 et IPv6,
   * hostnames, domaines (pour résolution inverse),
 * stockage des données dans une base SQLite,
 * analyse des logs "au fil de l'eau",
 * peut exécuter plusieurs filtres sur différents fichiers de logs,
 * peut exécuter plusieurs filtres sur un même fichier de log,
 * déclenchement sur **TRIGGERS**:
   * nombre d'évènnements,
   * période,
   * durée du blocage
 * plusieurs **TRIGGERS** possibles par filtre
 * ...

## Prérequis:
**simpleban** a été écrit à l'origine sur Ubuntu 14.04 LTS, il a été testé
récemment sur Ubuntu 20.04 Debian 12.
Le script **install.sh** ajoute les paquets nécessaires.

## Installation:
 * Télécharger les scripts: ``git clone https://github.com/lspagnol/simpleban2``
 * Installer les scripts: ``cd simpleban2 ; bash install.sh``

## Configuration
 * Editer le fichier **/etc/simpleban/sban.cf**
 * Copiez / éditez les modèles de filtres: **/etc/simpleban/filters/**
 * Choix du mode de fonctionnement:
   * l3 / iptables (par défaut) => adapté aux stations et à la virtualisation si les invités ne sont pas bridgés sur une interface physique (NAT depuis l'hôte, les invités ne sont pas joignables directement depuis le réseau),
   * l2 / ebtables => adapté aux hyperviseurs si les invités sont bridgés sur une interface physique (les invités sont joignables directement depuis le réseau).

## Migration de SQLite2 à SQLite3
* Vérifier le format de la base: ``file /var/lib/simpleban``
* Convertir la base si nécessaire: ``sqlite /var/lib/simpleban/sban.db .dump | sqlite3 /var/lib/simpleban/new.db ; mv /var/lib/simpleban/new.db /var/lib/simpleban/sban.db``

## ATTENTION à la rotation des logs
* Le démon **sban** doit être redémarré lors de la rotation des logs.
* Exemple de configuration de **logrotate** avec analyse des logs de Postfix, et Perdition:
  * **/etc/simpleban/sban.cf** => `FILTERS='perdition_auth postfix_auth'`
  * **/etc/simpleban/filters/perdition_auth.cf** => `LOG='/var/log/perdition/perdition.log'`
  * **/etc/simpleban/filters/postfix_auth.cf** => `LOG='/var/log/postfix/postfix.log'`

**/etc/logrotate.d/rsyslog**:
```
...
# Ubuntu 16.04 LTS
/var/log/postfix/postfix.log
/var/log/perdition/perdition.log
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
        prerotate
                service sban stop >/dev/null 2>&1 ||true
        endscript
        postrotate
                invoke-rc.d rsyslog rotate > /dev/null || true
                service sban start >/dev/null 2>&1 || true       
        endscript
}
...
```

## Contacts:
* Mail: laurent DOT spagnol AT univ-reims DOT fr
* Liste de diffusion / mailing-list: simpleban AT univ-reims DOT fr
