#!/bin/bash

# Install Ansible to provision host
sudo dnf -y install ansible

# Run Ansible provisioning
ansible-playbook -i hosts box_pre_build.yml --connection=local --ask-sudo-pass

# Zero out the free space to save space in the final image:
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY

sleep 15s

history -cw

sudo reboot
