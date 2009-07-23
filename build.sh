#!/bin/bash -ex
# based on http://tldp.org/HOWTO/html_single/Debian-Binary-Package-Building-HOWTO/

name=hudson-swarm-slave
version=1.0

mkdir debian/DEBIAN || true
cat > debian/DEBIAN/control << EOF
Package: $name
Version: $version
Section: base
Priority: optional
Architecture: all
Depends: coreutils, daemon
Maintainer: Kohsuke Kawaguchi <kohsuke.kawaguchi@sun.com>
Description: Hudson swarm slave
EOF


# build a package
pkg=${name}_${version}_all.deb
fakeroot dpkg-deb --build debian $pkg
cp $pkg ~/debian-repository/binary

