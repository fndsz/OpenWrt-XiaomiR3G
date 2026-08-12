#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# ----------files/ 大法覆盖（优先级最高，推荐） ----------
mkdir -p files/etc/init.d
if [ -f "package/feeds/packages/ttyd/files/etc/init.d/ttyd" ]; then
    cp package/feeds/packages/ttyd/files/etc/init.d/ttyd files/etc/init.d/ttyd
    chmod 755 files/etc/init.d/ttyd
    echo "✅ copied ttyd init.d -> files/etc/init.d/ttyd (755)"
fi

# 修改默认IP
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# 修改主机名称
sed -i 's/ImmortalWrt/Mi-R3G/g' package/base-files/files/bin/config_generate


