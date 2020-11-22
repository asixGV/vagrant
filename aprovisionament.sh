#!/usr/bin/env bash

# Usem usr bin env bash ja que aixi ens trobarà els programes que instal·lem sigui
# quina sigui la seva localització
# ens dona flexibilitat de poder instalar-ho a diferents sistemes

echo -e "\nAprovisionament per a la pràctica 17 M06 - Gonzalo Vidal\n"

#redirigim el stdout a dev null, que ho descarta directament i amb 2>&1 ens redirieix
# el stderr (2) a stdout (1)

echo -e " --> Updatejant el servidor.\n\n"
sudo apt-get update >/dev/null 2>&1
sudo apt-get upgrade >/dev/null 2>&1

echo -e "\n --> Instal·lant cURL.\n\n"
sudo apt-get install -y curl >/dev/null 2>&1
#Amb la opcio -y aceptem totes les preguntes de si o no amb un si.
echo -e "\n --> Instal·lant MySQL.\n\n"
sudo apt-get install -y mysql-client >/dev/null 2>&1

echo -e "\n --> Instal·lant vim. \n\n"
sudo apt-get install -y vim  >/dev/null 2>&1

echo -e "\n --> Instal·lant wget. \n\n"
sudo apt-get install -y wget >/dev/null 2>&1

echo -e "\n --> Instal·lant  Apache.\n\n"
sudo apt-get install -y apache2 >/dev/null 2>&1
echo "ServerName localhost" >> /etc/apache2/apache2.conf

#Buscant a internet, he buscat tots els paquets de PHP7.2, si volguesis ficar la versió 7.4 només hauries de canviar el numero
echo -e "\n --> Instal·lant PHP 7.2 i els seus mòduls princiapals.\n\n"
sudo apt-get install -y python-software-properties >/dev/null 2>&1
sudo add-apt-repository -y ppa:ondrej/php >/dev/null 2>&1
sudo apt-get update >/dev/null 2>&1
sudo apt-get install -y php7.2 >/dev/null 2>&1
sudo apt-get install -y php-pear >/dev/null 2>&1
sudo apt-get install -y php7.2-curl >/dev/null 2>&1
sudo apt-get install -y php7.2-dev >/dev/null 2>&1
sudo apt-get install -y php7.2-gd >/dev/null 2>&1
sudo apt-get install -y php7.2-mbstring >/dev/null 2>&1
sudo apt-get install -y php7.2-zip >/dev/null 2>&1
sudo apt-get install -y php7.2-mysql >/dev/null 2>&1
sudo apt-get install -y php7.2-xml >/dev/null 2>&1

echo -e "\n --> Instal·lant MySQL. La contrasenya sera 'asix'.\n\n"

# amb <<< fem que la paraula a la dreta de <<< sigui el stdin de la comanda de la esquerra
# amb debconf-set-selections insertem valors nous a la base de dades debconf
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password asix'

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password asix'

#Fem una instal·lació amb silenciosa amb -q i acceptant-ho tot amb -y

sudo apt-get -q -y install mysql-server >/dev/null 2>&1
ROOT_DB_PASSWORD="mypass"

#Amb l'editor sed, i la opció -e afegim l'escript mysqld.cnf. amb -i editem el fitxer
#sense importar enllaços durs ni tous
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

#Executem la comanda SQL de asignar a root tots el privilegis. Amb un flush ens assegurem que es facin efectius, encara que no
#faci falta realment ja que estem usant la comanda GRANT.
SQL="GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'mypass' WITH GRANT OPTION; FLUSH PRIVILEGES;"

#amb -e ens assegurem que la comanda s'executi.
mysql -uroot -p${ROOT_DB_PASSWORD} -e "${SQL}"



echo -e "\n --> Instal·lant adminer \n\n"
echo -e "\n Creant carpeta a /usr/share/adminer \n\n"
#crearem una carpeta per adminer
sudo mkdir /usr/share/adminer
#descarreguem adminer
sudo wget "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php >/dev/null 2>&1

#creem un enllaç suau entre latest i adminer
sudo ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php

#amb Tee llegim del stdin i escrivim al stdout. Afegirem la linea "Alias /adminer...
echo "Alias /adminer.php /usr/share/adminer/adminer.php" | sudo tee /etc/apache2/conf-available/adminer.conf
#Activem adminer amb PHP
sudo a2enconf adminer.conf

echo -e "\n --> Reiniciant mysql i apache2. \n\n"
sudo service mysql restart
sudo service apache2 reload

echo -e "\n ==> ADMINER http://<Server_IP_or_Domain>/adminer.php <==\n\n"

echo -e "\n ==> ACABAT! <==\n\n"

echo -e "\n ! LAMP STATUS: Instal·lats-> MySQL, PHP7.2, Apache So\n STACK LAMP I ADMINER INSTAL·LATS CORRECTAMENT\n"
