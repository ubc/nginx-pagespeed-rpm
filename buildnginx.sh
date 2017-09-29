rm -f SOURCES/*.gz && \
rm -f SOURCES/*.zip && \
rm -rf BUILD/* && \
rm -rf BUILDROOT/* && \
NX_VERSION=`grep "Version" SPECS/nginx.spec |cut -d " " -f 2` && \
wget http://nginx.org/download/nginx-${NX_VERSION}.tar.gz -P SOURCES/ && \

NPS_VERSION=`grep "define nps_version" SPECS/nginx.spec |cut -d " " -f 3` && \
wget https://github.com/pagespeed/ngx_pagespeed/archive/v${NPS_VERSION}-beta.zip -P SOURCES/ && \


# 32-bit PSOL
# wget https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}-ia32.tar.gz -P SOURCES/ && \

# 64-bit PSOL
wget https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}-x64.tar.gz -P SOURCES/ && \
rpmbuild -ba SPECS/nginx.spec
