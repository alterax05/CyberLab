FROM ubuntu:latest
RUN apt-get update \
    && apt-get install -y apache2 openssh-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir /var/run/sshd
RUN useradd -m -s /bin/bash pippo
RUN echo 'pippo:1234' | chpasswd
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN echo "Congratulazioni!\nHai completato questa challange!\nflag{docker_e'_bello}\n" > /etc/motd
COPY index.html /var/www/html/
RUN rm /etc/update-motd.d -r
EXPOSE 22 80
CMD ["/bin/bash", "-c","/usr/sbin/apache2ctl -D FOREGROUND & /usr/sbin/sshd -D"]