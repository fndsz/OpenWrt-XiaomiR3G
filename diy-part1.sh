#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git smpackage https://github.com/kenzok78/small-package' feeds.conf.default
#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
#sed -i '$a src-git small8 https://github.com/kenzok8/small-package' feeds.conf.default
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-packages' feeds.conf.default
#sed -i '$a src-git immortalwrt https://github.com/immortalwrt/packages' feeds.conf.default
 sed -i '$a src-git mmdvm https://github.com/lazywalker/mmdvm-openwrt' feeds.conf.default
 #sed -i '$a src-git YSFClients https://github.com/qzyuebing/YSFClients.git' feeds.conf.default
 #sed -i '$a src-git YSF2DMR https://github.com/ea5gvk/YSF2DMR.git' feeds.conf.default
 sed -i '$a src-git mmdvm-feeds https://github.com/hamclub/mmdvm-feeds.git' feeds.conf.default
####### Replace with JerryKuKu’s Argon
rm -rf openwrt/package/lean/luci-theme-argon #delete original argon theme
rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf package/lean/luci-theme-argon  #删除原Argon主题
git clone https://github.com/siwind/luci-app-wolplus.git package/lean/luci-app-wolplus
cd ..
#cd ..
 
