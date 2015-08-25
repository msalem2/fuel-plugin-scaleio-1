#!/bin/bash
# Installation script for setting up a fuel 
# Plugin development machine on Ubuntu 
# Refer to https://wiki.openstack.org/wiki/Fuel/Plugins


sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install createrepo rpm dpkg-dev git -y

sudo apt-get install python-pip -y

sudo git clone https://github.com/stackforge/fuel-plugins.git

cd fuel-plugins/fuel_plugin_builder/

sudo python setup.py develop

# Installting Fail2Ban
# https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-fail2ban-on-ubuntu-14-04
# sudo apt-get install fail2ban -y
# sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local



