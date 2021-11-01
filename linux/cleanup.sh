#!/bin/bash
#empty /tmp and /var/tmp directories
#cd /tmp 
#rm -r *
rm -rf /tmp/*
#cd /var/tmp
#rm -r *
rm -rf /var/tmp/*
#
#clean apt cache
apt clean -y
#
# clean thumbnails cache
rm -rf /home/sysadmin/.cache/thumbnails
rm -rf /home/instructor/.cache/thumbnails
rm -rf /home/student/.cache/thumbnails
rm -rf /root/.cache/thumbnails
#
#
