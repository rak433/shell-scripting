#!/bin/bash

#check if user is having sudo access
user_id=$(id -u)

if [ ${user_id} -ne 0 ]; then
   echo "User $USER is not having sudo access"
   exit 1
fi

validate(){
    if [ ${1} -ne 0 ]; then
       echo "${2} installation is failed"
       exit 1
    else
       echo "${2} installation success"
    fi
}

echo "starting installation"

#Installing nginx package
dnf install nginx -y
validate $? "nginx installation"


#Installing mysql-server
dnf install mysql-server -y
validate $? "mysql-server installation"

echo "Packages installation completed"