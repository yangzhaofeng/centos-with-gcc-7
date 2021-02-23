FROM centos:6.10

COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo

RUN yum makecache && yum update -y && yum install -y epel-release centos-release-scl centos-release-scl-rh

COPY CentOS-SCLo-*.repo /etc/yum.repos.d/

RUN yum makecache && \
	yum install -y wget devtoolset-7-gcc-c++ devtoolset-7-gcc-gdb-plugin devtoolset-7-make ninja-build && \
	cd /opt && \
	wget https://github.com/Kitware/CMake/releases/download/v3.12.4/cmake-3.12.4-Linux-x86_64.tar.gz && \
	tar -zxf cmake-3.12.4-Linux-x86_64.tar.gz && \
	rm cmake-3.12.4-Linux-x86_64.tar.gz

ENV PATH="/opt/cmake-3.12.4-Linux-x86_64/bin:/opt/rh/devtoolset-7/root/usr/bin:${PATH}"

ENV LD_LIBRARY_PATH="/opt/rh/devtoolset-7/root/usr/lib:${LD_LIBRARY_PATH}"
