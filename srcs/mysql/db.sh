sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*skip-networking.*|skip-networking=false|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*\[mysqld\].*|\[mysqld\]\nskip-networking=false\nbind-address=0.0.0.0|g" /etc/my.cnf
sed -i "s|.*skip-networking.*|skip-networking=false|g" /etc/my.cnf
# echo "port = 3306" >> /etc/my.cnf

# db_name='wordpress'
# db_name2='phpmyadmin'
# username='root'
# password=''
# hostname='mysql-service:3306'

openrc default
rc-service mariadb setup
rc-service mariadb start

# # WordPress database
# service mysql start
# mysql -e "CREATE DATABASE $db_name;"
# mysql -e "CREATE DATABASE $db_name2;"
# mysql -e "CREATE USER '$username'@'localhost' IDENTIFIED BY '$password';"
# #mysql  -e "CREATE USER 'adminwp'@'localhost' IDENTIFIED BY 'adminwp';"
# mysql -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$username'@'$hostname' WITH GRANT OPTION;"
# mysql -e "UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='$username';"

# #mysql  -e "CREATE USER 'adminwp'@'localhost' IDENTIFIED BY 'adminwp';"
# mysql -e "GRANT ALL PRIVILEGES ON $db_name2.* TO '$username'@'$hostname' WITH GRANT OPTION;"
# mysql -e "UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='$username';"

# mysql -e "FLUSH PRIVILEGES;"

echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
# echo "CREATE DATABASE phpmyadmin;"| mysql -u root --skip-password
echo "CREATE USER admin;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%' IDENTIFIED BY 'admin';"| mysql -u root --skip-password
# echo "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'admin'@'%' IDENTIFIED BY 'admin';"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%' WITH GRANT OPTION;"| mysql -u root --skip-password
# echo "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'admin'@'%' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password


#phpmyadmin database
# mysql < phpmyadmin.sql
mysql < wordpress.sql
rc-service mariadb stop
mysqld_safe
