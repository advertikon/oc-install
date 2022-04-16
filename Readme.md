Containerized OpenCart development environment
----------------------------------------------

In order to create environment run:

`OC_VERSION=3038 docker-compose up -d`

It will run:
+ Nginx:latest on port 80
+ MySql:8.0
+ PHP:8.0
+ FTP server
+ and it will also create folder /www in the current directory and put OpenCart's root there 

***Supported php versions:***
+ 8.0

***Supported OpenCart versions:***
+ 2.2.0.0
+ 3.0.3.8

***OpenCart admin area credentials:*** *admin / admin*
