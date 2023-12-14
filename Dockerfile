FROM ubuntu:latest
RUN apt-get update \
    && apt-get install -y apache2 openssh-server coreutils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir /var/run/sshd
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
COPY finish.sh non_guardare.txt /
RUN chmod +x finish.sh
COPY index.html /var/www/html/
EXPOSE 22 80
CMD ["/bin/bash", "-c","finish.sh & /usr/sbin/apache2ctl -D FOREGROUND & /usr/sbin/sshd -D"]