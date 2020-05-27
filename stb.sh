#!/bin/bash
apt update
apt upgrade

#MariaDB (Pengganti MySQL) 
apt-get -y install mariadb-server mariadb-client
mysql_secure_installation

#Apache web server
apt-get -y install apache2

#PHP 7
apt-get -y install php7.0 libapache2-mod-php7.0
apt-get -y install php7.0-mysql php7.0-curl
service apache2 restart

#phpMyAdmin
apt-get -y install phpmyadmin
sudo ln -s /usr/share/phpmyadmin /var/www/html/

#buat akun admin phpmyadmin
sudo mysql -u root
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'XEg8uLVc';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit
service apache2 restart

cd /var/www/html
rm -rf index.html
wget https://raw.githubusercontent.com/lebgodeg/mikhmon/master/mikhmon.tar
wget https://raw.githubusercontent.com/lebgodeg/mikhmon/master/mikbotam.tar
tar -xvf mikhmon.tar
tar -xvf mikbotam.tar

#Script chown filder mikbotam:
chown -R www-data:www-data mikbotam
chown -R www-data:www-data mikhmon

chmod 777 mikhmon

rm -rf mikhmon.tar
rm -rf mikbotam.tar

cd /etc/
rm -rf /etc/rc.local
wget https://raw.githubusercontent.com/lebgodeg/mikhmon/master/rc.local

cd /etc/systemd/system
wget https://raw.githubusercontent.com/lebgodeg/mikhmon/master/rc-local.service
chmod +x /etc/rc.local
systemctl enable rc-local
systemctl start rc-local.service
cd

https://raw.githubusercontent.com/lebgodeg/mikhmon/master/cek_mikbotam.sh

cd /etc/cron.d/
https://raw.githubusercontent.com/lebgodeg/mikhmon/master/cek_mikbotam

#apt-get install dnsutils -y
#apt-get install dnsmasq -y
#rm -rf /etc/dnsmasq.conf
#rm -rf /etc/resolv.conf
#cd /etc/
#wget https://raw.githubusercontent.com/lebgodeg/mikhmon/master/dnsmasq.conf
#wget https://raw.githubusercontent.com/lebgodeg/mikhmon/master/resolv.conf



