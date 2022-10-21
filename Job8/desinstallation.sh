#!/bin/bash

#Il s agit d un script qui permet de désinstaller Proftpd et Git.

#-----------------------------------------------------------

# /!\ Il faut se mettre en su avant d'exécuter le script /!\

#-----------------------------------------------------------

apt-get -y remove proftpd-*
apt-get -y purge proftpd-*

apt-get -y remove git
apt-get -y purge git
