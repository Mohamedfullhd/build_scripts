#!/bin/bash

# Removals
rm -rf .repo/local_manifests

# Initialize repo with specified manifest
repo init -u https://github.com/2by2-Project/manifest.git -b Vanadium  --git-lfs

# Clone local_manifests repository
git clone https://github.com/Mohamedfullhd/local_manifests-gale.git --depth 1 -b 15 .repo/local_manifests

# Sync the repositories
/opt/crave/resync.sh

#Private Keys
rm -rf vendor/2by2-priv
git clone https://github.com/shravansayz/private_keys.git -b rise vendor/2by2-priv

export BUILD_USERNAME=@SudoMohamed
export BUILD_HOSTNAME=crave

#build
source build/envsetup.sh
lunch lineage_gale-bp1a-user
m installclean
m bacon
