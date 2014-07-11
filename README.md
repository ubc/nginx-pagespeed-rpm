Specs to build Nginx RPM with Pagespeed module
==============================================

Building the RPM
----------------

    git clone https://github.com/ubc/nginx-pagespeed-rpm.gi://github.com/ubc/nginx-pagespeed-rpm.git
    cd nginx-pagespeed-rpm
    NX_VERSION=`grep "Version" SPECS/nginx.spec |cut -d " " -f 2`
    wget http://nginx.org/download/nginx-${NX_VERSION}.tar.gz -P SOURCES/
    NPS_VERSION=`grep "define nps_version" SPECS/nginx.spec |cut -d " " -f 3`
    wget https://github.com/pagespeed/ngx_pagespeed/archive/release-${NPS_VERSION}-beta.zip -P SOURCES/
    wget https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}.tar.gz -P SOURCES/

    rpmbuild --define '_topdir `pwd`' -ba SPECS/nginx.spec


Updating to Newer Version of Nginx or Pagespeed
-----------------------------------------------

Update nps_version and Version in the SPECS/nginx.spec file.
