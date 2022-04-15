# pwd is /var/www/
cp -R -f data html
find html -type f -exec chmod 0666 {} \;
find html -type d -exec chmod 0777 {} \;

sleep 5

cd html/install

php cli_install.php install --db_hostname mysql --db_username user --db_password root --db_database \
 oc --db_driver mysqli --db_port 3306 --username admin --password admin --email youremail@example.com --http_server http://test.ua/