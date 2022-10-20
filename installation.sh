
#!/bin/bash


#Ceci est un script qui permet d'installer un FTP de façon automatisée.


# On utilise la commande su pour plus de facilités

#su -

#Création de deux utilisateurs
#useradd Merry
#useradd Pippin

#chpasswd Merry:kalimac
#chpasswd Pippin:secondbreakfast


#Installation de Git et Proftpd
apt-get -y install git && apt-get -y install proftpd-*
apt-get -y  upgrade && apt-get -y update

#Récupération des fichiers sur GitHub 

git clone https://github.com/aurore-thomas/FTP.git 


# On remplace les fichiers d'origine, en les sauvegardant au passage.
mv /etc/proftpd/proftpd.conf /etc/proftpd/save_proftpd.conf
mv /etc/proftpd/modules.conf /etc/proftpd/save_modules.conf
mv /etc/proftpd/tls.conf /etc/proftpd/save_tls.conf

mv FTP/proftpd.conf /etc/proftpd/proftpd.conf
mv FTP/tls.conf /etc/proftpd/tls.conf
mv FTP/modules.conf /etc/proftpd/modules.conf


# On génère les clés pour la connexion FTPS :  
mkdir /etc/proftpd/ssl
cd /etc/proftpd/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -out proftpd-rsa.pem -keyout proftpd-key.pem
chmod 0600 proftpd-key.pem


#On redémarre le tout : 
cd
service proftpd restart

