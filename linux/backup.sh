#!/bin/bash
mkdir -p /var/backup
mkdir -p  /home/sysadmin/backup
tar cf /var/backup/home.tar /home
the_date=`date +"%m%d%Y"`;
mv /var/backup/home.tar /var/backup/home.$the_date.tar
ls -l /var/backup >> /home/sysadmin/backup/file_report.txt
mv /home/sysadmin/backup/file_report.txt /var/backup/file_report.txt
free -h >> /home/sysadmin/backup/disk_report.txt
sudo mv /home/sysadmin/backup/disk_report.txt /var/backup/disk_report.txt






