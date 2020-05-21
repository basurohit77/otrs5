FROM docker.io/rohitbasu77/otrs5-fedora3
LABEL maintainer="Rohit <basurohit77@gmail.com>"
LABEL description="Fedora3.1 with Perl5.30 and Otrs5-Mariadb10"
ENV container docker
RUN dnf -y install mariadb; dnf -y install httpd; dnf -y install otrs; dnf clean all; systemctl enable httpd; systemctl enable mariadb;
STOPSIGNAL SIGRTMIN+3
EXPOSE 8080 80 8443 443 3306 22
#RUN --tmpfs /tmp --tmpfs /run cp Dockerfle /tmp/
#RUN --mount=type=tmpfs,target=/tmp --mount=type=tmpfs,target=/run dnf clean all;
VOLUME [ "/sys/fs/cgroup" ]
VOLUME [ "/tmp" ]
VOLUME [ "/run" ]
USER root
ENTRYPOINT ["/bin/bash", "-c", "while true; do sleep 5; done"]
CMD [ "/sbin/init" ]

