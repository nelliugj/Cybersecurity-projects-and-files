#!/bin/bash
# updates 
# apt update -y
# upgrades
# apt upgrade -y
# install new pakages uninstall old ones 
# apt full-upgrade -y
# remove unused packages and thier configs
# apt autoremove --purge -y
# all in one:
apt update -y  && apt upgrade -y && apt full-upgrade -y && apt-get autoremove --purge -y


