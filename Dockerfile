FROM ubuntu:14.04
MAINTAINER Jim Lin <acgsong.tw@yahoo.com.tw>

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:admin1234' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible

RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
RUN echo 'export ANSIBLE_HOST_KEY_CHECKING=False' >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]