#!/bin/bash

# Removals
rm -rf .repo/local_manifests

# Initialize repo with specified manifest
repo init -u https://github.com/RisingOS-Revived/android.git -b qpr2 --git-lfs

# Clone local_manifests repository
git clone https://github.com/Mohamedfullhd/Build-.git .repo/local_manifests

# Sync the repositories
/opt/crave/resync.sh

#Private Keys
rm -rf vendor/lineage-priv
git clone https://github.com/shravansayz/private_keys.git -b rise vendor/lineage-priv

export BUILD_USERNAME=Mohamed
export BUILD_HOSTNAME=crave

#build
source build/envsetup.sh
riseup gale userdebug || riseup gale ap4a userdebug || riseup gale bp1a userdebug
rise b
