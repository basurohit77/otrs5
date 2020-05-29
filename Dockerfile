FROM docker.io/rohitbasu77/centos7_perl5_mariadb10
LABEL maintainer="Rohit <basurohit77@gmail.com>"
LABEL description="Fedora3.1 with Perl5.30 and Mariadb10"
ENV container docker
#ENV HTTP_PROXY "http://127.0.0.1:7080"
#ENV HTTPS_PROXY "https://127.0.0.1:7080"
#ENV FTP_PROXY "ftp://127.0.0.1:7080"
#ENV NO_PROXY "*.test.example.com,.example2.com"
RUN yum -y install epel-release; yum clean all; yum makecache; yum update -y; yum install -y rsyslog; yum install -y httpd;
RUN systemctl enable rsyslog.service; systemctl enable httpd;
CMD [ "/usr/lib/systemd/systemd" ]
ADD . /sys/fs/cgroup/.
EXPOSE 80 443 8080 8443 3306 22
VOLUME [ "/sys/fs/cgroup" ]
VOLUME [ "/tmp" ]
VOLUME [ "/run" ]
#RUN systemctl restart httpd; systemctl restart mariadb;
#ENTRYPOINT ["/bin/bash", "-c", "while true; do sleep 5; done"]
