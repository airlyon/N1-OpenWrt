#!/bin/bash

# Adjust source code
patch -p1 -f < $(dirname "$0")/luci.patch

# Add packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 clone/amlogic
#git clone https://github.com/xiaorouji/openwrt-passwall --depth=1 clone/passwall
git clone https://github.com/xiaorouji/openwrt-passwall2 --depth=1 clone/passwall2
git clone https://github.com/xiaorouji/openwrt-passwall-packages --depth=1 clone/passwall-packages

# Update packages
rm -rf feeds/luci/applications/luci-app-passwall
cp -rf clone/amlogic/luci-app-amlogic clone/passwall2/luci-app-passwall2 clone/passwall-packages/[a-z]* feeds/luci/applications/
sed -i '/luci-app-attendedsysupgrade/d' feeds/luci/collections/luci/Makefile

# Clean packages
rm -rf clone
