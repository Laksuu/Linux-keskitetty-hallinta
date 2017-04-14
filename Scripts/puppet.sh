#!/bin/bash

#asennetaan puppet
sudo apt-get install puppet

sudo puppet --version

echo "Puppet on asentunut"

cd /etc/puppet/modules/

pwd

#Kopioidaan Githubin modules-hakemisto Puppettiin

echo "aloitetaan kopiointi"

sudo cp -a /home/$(whoami)/Linux-keskitetty-hallinta/modules/. /etc/puppet/modules/

echo "Kopiointi onnistui"

ls


