FROM ubuntu:22.04

# Install OpenSSH Server
RUN apt-get update && apt-get install -y openssh-server sudo && \
    mkdir /var/run/sshd

# Add user and set password
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

# Set up SSH key
RUN mkdir -p /home/docker/.ssh
COPY authorized_keys /home/docker/.ssh/authorized_keys
RUN chown -R docker:docker /home/docker/.ssh && chmod 700 /home/docker/.ssh && chmod 600 /home/docker/.ssh/authorized_keys
RUN echo 'docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]