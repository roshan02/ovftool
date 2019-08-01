FROM ubuntu:16.04
WORKDIR /root
#### ---- Install Package Dependencies ---- ####

RUN apt-get update && \
apt-get install -yq --no-install-recommends \
build-essential \
gcc \
gcc-multilib \
uuid \
uuid-dev \
perl \
libxml-libxml-perl \
perl-doc \
libssl-dev \
e2fsprogs \
libarchive-zip-perl \
libcrypt-ssleay-perl \
libclass-methodmaker-perl \
libdata-dump-perl \
libsoap-lite-perl \
git \
make \
unzip \
wget \
vim && \
apt-get clean
#&& \
#rm -rf /var/lib/apt/lists/* /var/tmp/*
ENV VSPHERE65_SDK_PERL=VMware-vSphere-CLI-6.5.0-4566394.x86_64.tar.gz
RUN wget http://blr-dbc504.eng.vmware.com/amb/vmw-sdk-bundles-65/$VSPHERE65_SDK_PERL -P /tmp/

#### ---- Install vSphere CLI/SDK for Perl 6.5 ---- ####

RUN sed -i '2621,2635d' /tmp/vmware-vsphere-cli-distrib/vmware-install.pl && \
/tmp/vmware-vsphere-cli-distrib/vmware-install.pl -d EULA_AGREED=yes && \
#rm -rf /tmp/vmware-vsphere-cli-distrib/
# Run Bash when the image starts
CMD ["/bin/bash"]