#!/bin/bash
# Tool for admin virtual hosts
# Run as SU
# @TODO enable https (cerbot)


#catch DNS

DNS=$1
HTTPS=$2


#Validate
if [ -z "$1" ]
  then
    echo "usage: ./virtual_host.sh example.com"
    exit 1
fi

#VARS
DocumentRoot=/var/www/html/mds-tools/www/en/funnels/pages/
vhFile="000-$DNS.conf"
pathfileVH="/etc/apache2/sites-available/$vhFile"


#create file
echo "#Virtual Host $DNS
<VirtualHost *:80>
        ServerName $DNS 
        SetEnv MDS_ENVIRONMENT dev
        DocumentRoot $DocumentRoot
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
" >> $pathfileVH


#enable virtual host
cd /etc/apache2/sites-available/
a2ensite $vhFile

#add dns to hosts
echo "127.0.0.1		localhost	$DNS" >> /etc/hosts

#restart apache
service apache2 restart



