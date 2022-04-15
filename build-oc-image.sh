#!/bin/bash
OC_VERSION=$1

if [ ! -d "installations/$OC_VERSION" ]; then 
	echo "Inatallation $OC_VERSION does not exist"
	exit 1
fi

cp install.sh "installations/$OC_VERSION"

docker build -t bogochunas/open-cart:$OC_VERSION -f Dockerfile "installations/$OC_VERSION"