#!/bin/bash

#check if user is having sudo access
user_id=$(id -u)

if [ ${user_id} -ne 0 ]; then
   echo "User $USER is not having sudo access"
   exit 1
fi

echo "starting installation"

#Installing nginx package
dnf install nginx -y

if [ $? -ne 0 ]; then
   echo "nginx package installation is failed"
   exit 1
else
   echo "nginx package installation success"
fi

#Installing mysql-server
dnf install mysql-server -y

if [ $? -ne 0 ]; then
   echo "mysql-server package installation is failed"
   exit 1
else
   echo "mysql-server package installation success"
fi

echo "Packages installation completed"
