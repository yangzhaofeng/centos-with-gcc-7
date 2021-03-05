FROM centos:6.10

ADD CentOS-*.repo /etc/yum.repos.d/

ADD ld-*.conf /etc/ld.so.conf.d/

RUN yum makecache && yum update -y && \
	yum install -y epel-release centos-release-scl centos-release-scl-rh && \
	rm -f /etc/yum.repos.d/CentOS-*.repo.rpmnew && \
	yum makecache && \
	yum install -y wget devtoolset-7-gcc-c++ devtoolset-7-gcc-gdb-plugin devtoolset-7-make python27 ninja-build git && \
	yum clean all && \
	ln -f -s /opt/rh/devtoolset-7/root/usr/lib/gcc/x86_64-redhat-linux/7/*.o /usr/lib64/ && \
	cd /opt && \
	wget -q https://github.com/Kitware/CMake/releases/download/v3.12.4/cmake-3.12.4-Linux-x86_64.tar.gz && \
	tar -zxf cmake-3.12.4-Linux-x86_64.tar.gz && \
	rm cmake-3.12.4-Linux-x86_64.tar.gz && \
	ldconfig

ENV PATH="/opt/cmake-3.12.4-Linux-x86_64/bin:/opt/rh/python27/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:${PATH}"
