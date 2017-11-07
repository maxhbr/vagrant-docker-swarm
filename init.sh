#!/usr/bin/env bash

cd $(dirname $0)

vagrant destroy -f
AUTO_START_SWARM=true vagrant up

docker-machine rm vagrant-swarm-host
docker-machine create --driver generic --generic-ip-address=192.168.10.2 --generic-ssh-key "swarm_id_rsa" --generic-ssh-user=vagrant vagrant-swarm-host
docker-machine env vagrant-swarm-host

echo "call:\n     eval \$(docker-machine env vagrant-swarm-host)"
