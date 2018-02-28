rm -f SOURCES/*.gz && \
rm -f SOURCES/*.zip && \
rm -rf BUILD/* && \
rm -rf BUILDROOT/* && \
NX_VERSION=`grep "Version" SPECS/nginx.spec |cut -d " " -f 2` && \
wget http://nginx.org/download/nginx-${NX_VERSION}.tar.gz -P SOURCES/ && \

NPS_VERSION=`grep "define nps_version" SPECS/nginx.spec |cut -d " " -f 3` && \
NPS_TYPE=`grep "define nps_type" SPECS/nginx.spec | cut -d " " -f 3` && \

wget https://github.com/apache/incubator-pagespeed-ngx/archive/v${NPS_VERSION}-${NPS_TYPE}.zip -P SOURCES/ && \

wget https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}-x64.tar.gz -P SOURCES/ && \

rpmbuild -ba SPECS/nginx.spec
