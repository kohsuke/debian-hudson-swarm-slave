#!/bin/bash -ex
# based on http://tldp.org/HOWTO/html_single/Debian-Binary-Package-Building-HOWTO/

name=hudson-swarm-slave
version=1.1

cat > debian/DEBIAN/control << EOF
Package: $name
Version: $version
Section: base
Priority: optional
Architecture: all
Depends: coreutils, daemon
Maintainer: Kohsuke Kawaguchi <kk@kohsuke.org>
Description: Jenkins swarm slave
EOF

# tell dpkg that this is a configuration file
echo /etc/default/$name > debian/DEBIAN/conffiles

# build a package
pkg=${name}_${version}_all.deb
fakeroot dpkg-deb --build debian $pkg
cp $pkg ~/debian-repository/binary

