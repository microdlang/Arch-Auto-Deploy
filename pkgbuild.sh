#!/bin/bash

set -ex

# Build package.
cd "src"
makepkg -sr --noconfirm
cd ".."

cp "src/aurutils-"*".pkg.tar.xz" "bin"

# Add package to repository.
cd "bin"
repo-add "aurutilsci.db.tar.gz" "aurutils-"*".pkg.tar.xz"
cd ".."

{ set +ex; } 2>/dev/null
