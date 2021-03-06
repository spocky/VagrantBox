apt-get -y install apache2
sed -i 's@User ${APACHE_RUN_USER}@User vagrant@' /etc/apache2/apache2.conf
sed -i 's@Group ${APACHE_RUN_GROUP}@Group vagrant@' /etc/apache2/apache2.conf

echo "" >> /etc/apache2/apache2.conf
echo "# Use this env variable in your code to add dev only features (debug, etc.)" >> /etc/apache2/apache2.conf
echo "SetEnv ENV_DEV true" >> /etc/apache2/apache2.conf

sed -i 's@/var/www@/vagrant/web@' /etc/apache2/sites-available/default
sed -i 's@AllowOverride None@AllowOverride All@' /etc/apache2/sites-available/default

usermod -aG adm vagrant

a2enmod actions
a2enmod rewrite
a2enmod php5
