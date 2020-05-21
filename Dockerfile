FROM docker.io/rohitbasu77/otrs5-fedora3
LABEL maintainer="Rohit <basurohit77@gmail.com>"
LABEL description="Fedora3.1 with Perl5.30 and Otrs5-Mariadb10"
ENV container docker
USER root
RUN dnf -y install mariadb; dnf -y install httpd; dnf -y install otrs; dnf clean all; systemctl enable httpd; systemctl enable mariadb;
STOPSIGNAL SIGRTMIN+3
EXPOSE 80 443 8080 8443 3306 22
#RUN --tmpfs /tmp --tmpfs /run cp Dockerfle /tmp/
#RUN --mount=type=tmpfs,target=/tmp --mount=type=tmpfs,target=/run dnf clean all;
RUN --mount=type=volume,source=/tmp,target=/tmp dnf clean all
RUN --mount=type=volume,source=/run,target=/run dnf clean all
RUN --mount=type=volume,source=/sys/fs/cgroup,target=/sys/fs/cgroup,readonly dnf clean all;
#VOLUME [ "/sys/fs/cgroup" ]
ENTRYPOINT ["/bin/bash", "-c", "while true; do sleep 5; done"]
CMD [ "/sbin/init" ]
