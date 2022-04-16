# pwd is /var/www/

rm -R -f html/*
echo 'Clean up html folder'
cp -R -f data/* html/
echo 'Copy file to html folder'

sleep 12

cd /var/www/html/install

php cli_install.php install --db_hostname mysql --db_username user --db_password root --db_database \
 oc --db_driver mysqli --db_port 3306 --username admin --password admin --email youremail@example.com --http_server http://test.ua/

cd /var/www/html/

php config-oc.php

find /var/www/html/ -type f -exec chmod 0666 {} \;
find /var/www/html/ -type d -exec chmod 0777 {} \;
