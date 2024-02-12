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




########### 更改大雕源码（可选）#########
sed -i 's/PATCHVER:=5.15/PATCHVER:=6.1/g' target/linux/x86/Makefile      
# sed -i 's/PATCHVER:=6.1/PATCHVER:=6.6/g' target/linux/x86/Makefile

# 修改ip地址为192.168.5.1
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# 2.清除登录密码
sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings

# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
# sed -i '/uci commit system/i\uci set system.@system[0].hostname='OpenWrt-123'' package/lean/default-settings/files/zzz-default-settings


# 版本号里显示一个自己的名字（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /OpenWrt ($(TZ=UTC-8 date "+%Y.%m.%d") compiled by cheery)/g" package/lean/default-settings/files/zzz-default-settings

# 更换默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-opentomcat/' feeds/luci/collections/luci/Makefile


# 修改概览里时间显示为中文数字
sed -i 's/os.date()/os.date("%Y年%m月%d日") .. " " .. translate(os.date("%A")) .. " " .. os.date("%X")/g' package/lean/autocore/files/x86/index.htm


# 调整 x86 型号只显示 CPU 型号
sed -i 's/${g}.*/${a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore

# 设置ttyd免帐号登录
# sed -i 's/\/bin\/login/\/bin\/login -f root/' feeds/packages/utils/ttyd/files/ttyd.config

# 插件切换到指定版本 
# OpenSSL
#pushd package/libs/openssl
#git checkout 4fd8d7b7f8b7752ba8bb06e0d43808d0c5fddde0
#popd
#
# curl
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=8.5.0/g' feeds/packages/net/curl/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=ce4b6a6655431147624aaf582632a36fe1ade262d5fab385c60f78942dd8d87b/g' feeds/packages/net/curl/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/net/curl/Makefile


# 删除自带插件
# rm -rf ./package/lean/luci-app-qbittorrent
rm -rf ./package/lean/luci-theme-argon
rm -rf ./feeds/luci/luci-theme-argon
# rm -rf ./package/lean/luci-app-nlbwmon
rm -rf ./package/lean/luci-app-netdata
# rm -rf ./package/lean/luci-app-wrtbwmon
# rm -rf ./package/lean/luci-app-serverchan
# rm -rf ./feeds/packages/net/adguardhome
# rm -rf ./feeds/packages/net/https-dns-proxy
# rm -rf ./feeds/diy/openwrt-adguardhome



#添加独立软件

#商城
#git clone https://github.com/linkease/istore.git package/istore

# git clone https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff

#sirpdboy
#git clone https://github.com/sirpdboy/sirpdboy-package.git package/sirpdboy-package
#git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
#git clone https://github.com/sirpdboy/luci-app-advanced.git package/luci-app-advanced
#git clone https://github.com/sirpdboy/netspeedtest.git package/netspeedtest
# rm -rf ./package/lean/luci-app-netdata
# git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata
#git clone https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice
#git clone https://github.com/sirpdboy/luci-app-autotimeset.git package/luci-app-autotimeset
# git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
# git clone https://github.com/small-5/luci-app-adblock-plus.git package/luci-app-adblock-plus
# git clone https://github.com/kiddin9/luci-app-dnsfilter.git package/luci-app-dnsfilter
# git clone https://github.com/kiddin9/openwrt-bypass.git package/openwrt-bypass

#添加额外非必须软件包
# git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
# git clone https://github.com/vernesong/OpenClash.git package/OpenClash
# git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
# git clone https://github.com/zzsj0928/luci-app-pushbot.git package/luci-app-pushbot
# git clone https://github.com/riverscn/openwrt-iptvhelper.git package/openwrt-iptvhelper
# git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
#添加smartdns
# git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
# git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
# echo 'src-git kenzo1 https://github.com/kenzok8/jell' >>feeds.conf.default
