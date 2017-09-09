FROM centos:7.3.1611
#FROM docker.io/centos
LABEL Maintainer="Len Garvey<lindsworth_garvey@surveysampling.com>" \
      Vendor="Centos" \
      License=GPLv2 \
      Version=3.10.0-327

ENV PATH $PATH:/root/rpmbuild:.

RUN yum -y install gcc \
	   make \
           openssl-devel \
           pcre \
           pcre-devel \
           readline-devel \
           redhat-rpm-config  \
           rpm-build   \
           rpmdevtools \
           rpmlint \
           wget  \
           zlib-devel.x86_64 && \
           yum clean all 
 
RUN mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS} && \
              echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros

ADD  SPECS/ ~/rpmbuild/SPECS/

VOLUME ["/root/rpmbuild"]
WORKDIR [ "/rpmbuild" ]

CMD ["--help"]

ENTRYPOINT ["/usr/bin/rpmbuild"]
