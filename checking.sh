#!/bin/bash

logs_folder="/var/log/shell-logs"
log_file="${logs_folder}/$0.log"

echo "script execution start at $(date +"%F %T")"
mkdir -p $logs_folder

#check if user is having sudo access
user_id=$(id -u)

if [ ${user_id} -ne 0 ]; then
   echo "User $USER is not having sudo access"
   exit 1
fi

validate(){
    if [ ${1} -ne 0 ]; then
       echo "${2} installation is failed" | tee -a $log_file
       exit 1
    else
       echo "${2} installation success" | tee -a $log_file
    fi
}

for package in $@
do
  echo "Going to install ${package}"
  dnf list insatlled $package
  if [ $? -ne 0 ]; then
     echo "going to install ${packge}"
     dnf install $package -y &>> $log_file
     validate $? "Installing ${package}"
  else
     echo "${package} already installed skipping"
  fi
done