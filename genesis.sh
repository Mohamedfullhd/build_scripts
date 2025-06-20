#!/bin/bash

# Removals
rm -rf .repo/local_manifests

# Initialize repo with specified manifest
repo init -u https://github.com/GenesisOS/manifest.git -b verve-qpr2 --git-lfs

# Clone local_manifests repository
git clone https://github.com/Mohamedfullhd/Build-.git .repo/local_manifests
# Sync the repositories
/opt/crave/resync.sh

#Private Keys
rm -rf vendor/genesis/signing
git clone https://github.com/shravansayz/private_keys.git -b rise vendor/genesis/signing

export BUILD_USERNAME=Mohamed
export BUILD_HOSTNAME=crave
export SKIP_ABI_CHECKS=true 
export allow_undefined_symbols=true
export check_elf_symbols=false

# Set up build environment
source build/envsetup.sh
lunch genesis_gale-userdebug || lunch genesis_gale-ap3a-userdebug || lunch genesis_gale-ap2a-userdebug
breakfast genesis_gale
make installclean
mka genesis
