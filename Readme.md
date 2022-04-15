Containerized OpenCart development environment
----------------------------------------------

In order to create environment run:
    OC_VERSION=3038 docker-compose up -d

It will run Nginx:latest + MySql:8.0 + PHP:8.0 and also create folder www in the current directory with OpenCart root 

Supported php versions:
+ 8.0

Supported OpenCart versions:
+ 3.0.3.8
