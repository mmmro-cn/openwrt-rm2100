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

# Modify default IP
sed -i 's/192.168.1.1/192.168.99.1/g' package/base-files/files/bin/config_generate

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 下载并部署 Tailscale
curl -L https://github.com/adyanth/openwrt-tailscale-enabler/releases/download/v1.60.0/openwrt-tailscale-enabler-1.60.0_mipsel_24kbfs.tgz \
  | tar -zx -C /
opkg update
opkg install kmod-tun
/etc/init.d/tailscale enable
