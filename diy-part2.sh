#!/bin/bash
#
# diy-part2.sh - 在 feeds update 之后、feeds install 之前运行
# 用途：修复 mmdvm 在 21.02 上的编译兼容性、安装 feeds
#

# ===== 1. 修复 mmdvm 在 immortalwrt-21.02 上的编译问题 =====
if [ -d feeds/mmdvm ]; then
  echo "===> Fixing mmdvm for musl/gcc11 compatibility"
  cd feeds/mmdvm

  # 1.1 去掉 -lpthread（musl 下 pthread 已合入 libc）
  # 1.2 加上 -lm（musl 需要显式链接数学库）
  # 1.3 去掉 DEPENDS 里的 +libpthread
  # 1.4 加上 -std=c++17 -Wno-error（gcc11 对 C++17 更严格）
  find . -name Makefile -exec sed -i \
    -e 's/-lpthread//g' \
    -e '/+libpthread/d' \
    -e 's/^TARGET_LDFLAGS +=/TARGET_LDFLAGS += -lm/g' \
    -e '/TARGET_CFLAGS +=/s/$/ -std=c++17 -Wno-error/g' \
    -e 's/DEPENDS:=\(.*\)/DEPENDS:=\1 +libstdcpp/g' \
    {} +

  # 1.5 可选：如果有 mmdvm.patch 可以在这里打
  # if [ -f "$GITHUB_WORKSPACE/feeds-patches/mmdvm.patch" ]; then
  #   echo "===> Applying mmdvm.patch"
  #   git apply --forward "$GITHUB_WORKSPACE/feeds-patches/mmdvm.patch" || true
  # fi

  cd ../..
  echo "===> mmdvm fix done"
else
  echo "::warning::feeds/mmdvm not found, skip fix"
fi

# ===== 2. 安装所有 feeds =====
./scripts/feeds install -a

# ===== 3. 可选：改默认 IP（如果需要）=====
# sed -i 's/192.168.6.1/192.168.8.1/g' package/base-files/files/bin/config_generate
