#!/bin/bash

set -ex

# Environment variables.
export PACKAGER="Admin Localnet"

# Build package.
cd "src"
makepkg -Lcrs --noconfirm
cd ".."

cp "src/aurutils-"*".pkg.tar.xz" "bin"

# Add package to repository.
cd "bin"
repo-add "aurutilsci.db.tar.gz" "aurutils-"*".pkg.tar.xz"
cd ".."

{ set +ex; } 2>/dev/null
