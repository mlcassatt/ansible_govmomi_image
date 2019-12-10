# ansible_govmomi_image
This RHEL UBI includes the python dependencies as well as tooling of govmomi and ansible to enable ansible automation of a vsphere environment.

Includes: 
* Govmomi - govc
* Python environment with pip2 and necessary tooling for Ansible and pyvmomi
* Ansible 2.8 

## Usage:
``podman run -it --rm --name ansible -v `pwd`:/work/:Z -v ./:/etc/ansible:Z -v ~/.ssh:/root/.ssh:Z pyvmomi ansible-playbook main.yml``
  
User's ansible.cfg should be mounted at /etc/ansible/ansible.cfg for use
To simplify for your environment, use ssh-keys setup for your systems and mounted in this container at /root/.ssh
