#!/bin/bash

set -ex

# Environment variables.
export PACKAGER="https://travis-ci.org/${1}/builds/${2}"

# Variables declaration.
declare -r pkgrepo="${1#*/}"

# Import GPG key.
gpg --recv-keys DBE7D3DD8C81D58D0A13D0E76BC26A17B9B7018A

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
