#!/bin/bash

#Il s agit d un script qui permet de désinstaller Proftpd.

#-----------------------------------------------------------

# /!\ Il faut se mettre en su avant d'exécuter le script /!\

#-----------------------------------------------------------

apt-get -y remove proftpd-*
apt-get -y purge proftpd-*
