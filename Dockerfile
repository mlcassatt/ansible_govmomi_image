# pull base image
FROM registry.access.redhat.com/ubi8/ubi:latest

RUN echo "===> Adding Ansible's prerequisites..."   && \
    yum update -y                                   && \
    yum install -y  \
#                build-essential                        \
                python2 python2-pip python2-devel           \
                libffi-devel                   \
#                libxml2-devel libxslt1-devel zlib1g-devel    \
                git \
                rsync                                && \
    python2 -m pip install --upgrade pip && \
    pip2 install --upgrade setuptools pip wheel      && \
    pip2 install --upgrade pyyaml jinja2 && \ 
#pycrypto    && \
    pip2 install --upgrade pywinrm                   && \
    pip2 install --upgrade pyvmomi                   && \
    pip2 install --upgrade ansible                   && \
    pip2 install --upgrade openstacksdk              && \
    pip2 install --upgrade bcrypt                    && \
    \
#    echo "===> Installing handy tools (not absolutely required)..."  && \
#    apt-get install -y sshpass openssh-client  && \
#    \
    curl -LO https://github.com/vmware/govmomi/releases/download/v0.21.0/govc_linux_amd64.gz && \
    gunzip govc_linux_amd64.gz                       && \
    chmod +x govc_linux_amd64                        && \
    cp govc_linux_amd64 /usr/bin/govc                && \
    echo "===> Clean up..."                                         && \
    yum clean all && \
#    rm -rf /var/lib/yum/lists/*                                     && \
    \
    echo "===> Adding hosts for convenience..."  && \
    mkdir -p /etc/ansible                        && \
    echo 'localhost' > /etc/ansible/hosts

# ENV PATH        /opt/ansible/bin:$PATH
# ENV PYTHONPATH  /opt/ansible/lib:$PYTHONPATH
# ENV MANPATH     /opt/ansible/docs/man:$MANPATH

WORKDIR /work

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
