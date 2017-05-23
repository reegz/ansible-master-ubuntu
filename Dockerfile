# Use Ubuntu 17.04 as the base package
FROM ubuntu:17.04

# Update and upgrade the distro. Primary reason is to get the apt-add-repository functionality
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y software-properties-common python-software-properties vim ssh \
    && apt-add-repository -y ppa:ansible/ansible \
    && apt-get update \
    && apt-get install -y ansible 

# Set autostart for SSH daemon and generate SSH keys
RUN update-rc.d ssh defaults \
    && mkdir -p /root/.ssh \
    && chmod 0700 /root/.ssh \
    && ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa.ansible

# Expose ports
EXPOSE 22

# Default startup
CMD ["/bin/bash"]
 
