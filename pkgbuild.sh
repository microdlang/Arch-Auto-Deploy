#!/bin/bash

set -ex

# Environment variables.
export PACKAGER="https://travis-ci.org/${1}/builds/${2}"

# Variables declaration.
declare -r pkgrepo="${1#*/}"

# Build packages.
sudo chown -R pkguser:pkguser packages
cd packages

for dir in */; do
	cd "$dir"
	makepkg -Lcrs --noconfirm
	cp *.pkg.tar.xz "../../bin"
	cd ..
done

cd ..

# Add package to repository.
cd bin

for pkg in *.pkg.tar.xz; do
	repo-add "${pkgrepo}.db.tar.gz" "$pkg"
done

cd ..

{ set +ex; } 2>/dev/null
