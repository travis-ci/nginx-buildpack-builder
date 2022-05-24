#!/bin/bash
# Build NGINX and modules on Heroku.
# This program is designed to run in a web dyno provided by Heroku.
# We would like to build an NGINX binary for the builpack on the
# exact machine in which the binary will run.
# Our motivation for running in a web dyno is that we need a way to
# download the binary once it is built so we can vendor it in the buildpack.
#
# Once the dyno has is 'up' you can open your browser and navigate
# this dyno's directory structure to download the nginx binary.

NGINX_VERSION=${NGINX_VERSION-1.20.2}
PCRE_VERSION=${PCRE_VERSION-8.45}

nginx_tarball_url=http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
pcre_tarball_url=https://ftp.pcre.org/pub/pcre/pcre-${PCRE_VERSION}.tar.gz

temp_dir=$(mktemp -d /tmp/nginx.XXXXXXXXXX)

cd $temp_dir
echo "Temp dir: $temp_dir"

echo "Downloading $nginx_tarball_url"
curl -L $nginx_tarball_url | tar xzv

echo "Downloading $pcre_tarball_url"
(cd nginx-${NGINX_VERSION} && curl -L $pcre_tarball_url | tar xzv )

(
	cd nginx-${NGINX_VERSION}
	./configure \
		--with-pcre=pcre-${PCRE_VERSION} \
		--prefix=/tmp/nginx
	make install
)
