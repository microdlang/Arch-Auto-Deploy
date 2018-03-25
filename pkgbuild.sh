#!/bin/bash

set -ex

# Environment variables.
export PACKAGER="https://travis-ci.org/${1}/builds/${2}"

# Variables declaration.
declare -r pkgrepo="${1#*/}"
declare -r pkgkey="DBE7D3DD8C81D58D0A13D0E76BC26A17B9B7018A"

# Import GPG key.
gpg --recv-keys --keyserver "hkp://ipv4.pool.sks-keyservers.net" $pkgkey

# Extract snapshot.
tar -xf "aurutils.tar.gz" --strip 1 -C "src"

# Build package.
cd "src"
makepkg -Lcrs --noconfirm
cd ".."

cp "src/aurutils-"*".pkg.tar.xz" "bin"

# Add package to repository.
cd "bin"
repo-add "${pkgrepo}.db.tar.gz" "aurutils-"*".pkg.tar.xz"
cd ".."

{ set +ex; } 2>/dev/null
