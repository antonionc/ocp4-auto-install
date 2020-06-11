#!/bin/bash

podman build -t ocp4-auto-install:latest images/

podman rm -fi ocp4-auto-install

podman run --name ocp4-auto-install --tty --workdir /opt/ocp4-auto-install --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro --volume=`pwd`:/opt/ocp4-auto-install ocp4-auto-install:latest ansible-playbook -i ,localhost deploy_all.yml

# For testing purposes run the container and test the ansible-playbooks inside
#podman run --name ocp4-auto-install -ti --workdir /opt/ocp4-auto-install --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro --volume=`pwd`:/opt/ocp4-auto-install ocp4-auto-install:latest



