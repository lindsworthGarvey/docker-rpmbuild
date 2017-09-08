# docker-rpmbuild

Docker container for building custom rpms.

# Features

The docker-rpmbuild container provides an isolated environment for building Custom RPMs. When invoked, the container accepts the specified ./SPECS/<rpm_specfile> preceded by the rpmbuild command options.


# Building the Container

* docker build --rm -t rpmbuild:4.11.3-21 .

    or

* docker build --force-rm=true --rm=true -t rpmbuild:4.11.3-21 .

[root@ssi-centos7 rpmBuild]# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
rpmbuild            4.11.3-21           02ff567cf556        44 seconds ago      537.2 MB
centos              7.3.1611            67df4d218ba5        5 weeks ago         254.9 MB
[root@ssi-centos7 rpmBuild]#

# Running Container

* Execcuting the container without arguments is the equivalent of executing the rpmbuild with the --help option as follows:

docker run --rm -v /root/rpmbuild:/root/rpmbuild:rw 02ff567cf556
*     ----------------------------Shortened for Brevity----------------------------

*Help options:
  -?, --help                    Show this help message
  --usage                       Display brief usage message


### Building RPMs

To build the RPM execute the docker run command with the options:
  *  --rm  to remove the container following exit
  *  -v /volume
  *         i. container_mount_point:permissions
  *   ~/rpmbuild/SPECS/haproxy.spec
  *         i. the location of the spec file
  *  --clean
  *      i. to clean up the host filesystem following the successful build.

*  docker run --rm -v /root/rpmbuild:/root/rpmbuild:rw 02ff567cf556 -bb ~/rpmbuild/SPECS/haproxy.spec --clean

The build rpm is placed in ~/rpmbuild/RPMS. The container can be modified or rebuilt to copy the file to a desginated a package repository and the repo's metadata created after it's been copied. 

[root@ssi-centos7 x86_64]# ls -lt ~/rpmbuild/RPMS/x86_64/
total 844
-rw-r--r--. 1 root root 854836 Aug 15 20:26 haproxy-1.7.8-1.el7.centos.x86_64.rpm
-rw-r--r--. 1 root root   5572 Aug 15 20:26 haproxy-debuginfo-1.7.8-1.el7.centos.x86_64.rpm
[root@ssi-centos7 x86_64]# 

