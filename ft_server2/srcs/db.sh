#!/bin/bash

db_name='wp_base'
username='adminwp'
password='adminwp'
hostname='localhost'

# WordPress database
service mysql start
mysql -e "CREATE DATABASE $db_name;"
mysql -e "CREATE USER '$username'@'localhost' IDENTIFIED BY '$password';"
#mysql  -e "CREATE USER 'adminwp'@'localhost' IDENTIFIED BY 'adminwp';"
mysql -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$username'@'$hostname' WITH GRANT OPTION;"
mysql -e "UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='$username';"
mysql -e "FLUSH PRIVILEGES;"

#phpmyadmin database
mysql < /var/www/server/phpmyadmin/sql/create_tables.sql
si-a3%
si-a3%
si-a3%
si-a3%
si-a3%
si-a3%
si-a3%
si-a3% cat db.sh
#!/bin/bash

db_name='wp_base'
username='adminwp'
password='adminwp'
hostname='localhost'

# WordPress database
service mysql start
mysql -e "CREATE DATABASE $db_name;"
mysql -e "CREATE USER '$username'@'localhost' IDENTIFIED BY '$password';"
#mysql  -e "CREATE USER 'adminwp'@'localhost' IDENTIFIED BY 'adminwp';"
mysql -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$username'@'$hostname' WITH GRANT OPTION;"
mysql -e "UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='$username';"
mysql -e "FLUSH PRIVILEGES;"

#phpmyadmin database
mysql < /var/www/server/phpmyadmin/sql/create_tables.sql
