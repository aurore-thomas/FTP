#!/bin/bash

#Il s agit d un script qui permet de désinstaller Proftpd. Au passage nous désinstallerons 
# aussi Git pour rendre la machine vierge de toute configuration

#su

apt-get -y remove proftpd-*
apt-get -y purge proftpd-*
