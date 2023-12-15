rm -f  ./SOURCES/*.gz && \
rm -f  ./SOURCES/*.zip && \
rm -rf ./BUILD/ngx_brotli/ && \
rm -rf ./ngx_brotli/ && \
rm -rf ./BUILD/* && \
rm -rf ./BUILDROOT/* && \

git clone https://github.com/google/ngx_brotli.git ./BUILD/ngx_brotli/ && \

NX_VERSION=`grep "Version" ./SPECS/nginx.spec | cut -d " " -f 2` && \
wget --no-verbose http://nginx.org/download/nginx-${NX_VERSION}.tar.gz -P ./SOURCES/ && \

rpmbuild --define "_sourcedir $(pwd)/SOURCES" --define "_builddir $(pwd)/BUILD" -bb $(pwd)/SPECS/nginx.spec
