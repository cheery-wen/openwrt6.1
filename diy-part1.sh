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
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default



####### darkmatter主题 #######
#echo 'src-git darkmatter git://github.com/apollo-ng/luci-theme-darkmatter.git' >>feeds.conf.default


# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# git clone https://github.com/sirpdboy/sirpdboy-package.git package/sirpdboy
# echo 'src-git MrH723 https://github.com/MrH723/openwrt-packages' >>feeds.conf.default
# echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
# echo 'src-git kenzo1 https://github.com/kenzok8/jell' >>feeds.conf.default


# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# Add a feed source

echo "开始 DIY1 配置……"
echo "========================="

function merge_package(){
    repo=`echo $1 | rev | cut -d'/' -f 1 | rev`
    pkg=`echo $2 | rev | cut -d'/' -f 1 | rev`
    # find package/ -follow -name $pkg -not -path "package/custom/*" | xargs -rt rm -rf
    git clone --depth=1 --single-branch $1
    mv $2 package/custom/
    rm -rf $repo
}
function drop_package(){
    find package/ -follow -name $1 -not -path "package/custom/*" | xargs -rt rm -rf
}
function merge_feed(){
    if [ ! -d "feed/$1" ]; then
        echo >> feeds.conf.default
        echo "src-git $1 $2" >> feeds.conf.default
    fi
    ./scripts/feeds update $1
    ./scripts/feeds install -a -p $1
}
rm -rf package/custom; mkdir package/custom



# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
# sed -i '$a src-git ssr https://github.com/fw876/helloworld' feeds.conf.default
# sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
# git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
git clone https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff
# git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata
git clone https://github.com/firker/diy-ziyong -b 2305 package/diy-ziyong
git clone https://github.com/jerrykuku/luci-theme-argon.git  package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git  package/luci-app-argon-config
# git clone https://github.com/linkease/istore.git package/istore
# git clone https://github.com/ElvenP/luci-app-onliner.git package/luci-app-onliner

# git clone https://github.com/sirpdboy/sirpdboy-package.git package/sirpdboy-package

#passwall
#git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall
#git clone https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall

git clone https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git package/openwrt-passwall
git clone https://github.com/Openwrt-Passwall/openwrt-passwall.git package/luci-app-passwall

# git clone -b luci-smartdns-dev https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall


# Go 1.21 updates
# rm -rf package/openwrt-passwall/brook
# rm -rf package/openwrt-passwall/v2ray-core
# svn export https://github.com/immortalwrt/packages/trunk/net/brook feeds/packages/net/brook
# ln -sf ../../../feeds/packages/net/brook ./package/feeds/packages/brook
# svn export https://github.com/immortalwrt/packages/trunk/net/v2ray-core feeds/packages/net/v2ray-core
# ln -sf ../../../feeds/packages/net/v2ray-core ./package/feeds/packages/v2ray-core



#passwall2
# git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall
# git clone https://github.com/xiaorouji/openwrt-passwall2.git package/luci-app-passwall2

#helloword
# git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr
# git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
# git clone https://github.com/fw876/helloworld.git package/helloworld


#smartdns
# git clone https://github.com/firkerword/luci-app-smartdns.git package/luci-app-smartdns
# git clone https://github.com/firkerword/smartdns.git package/smartdns
# git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# sed -i '$a src-git bypass https://github.com/garypang13/openwrt-bypass' feeds.conf.default
# git clone -b master https://github.com/vernesong/OpenClash.git package/OpenClash
# svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
# git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
# git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
# svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt package/aliyundrive-webdav
# git clone https://github.com/garypang13/luci-app-dnsfilter.git package/luci-app-dnsfilter
# git clone https://github.com/BCYDTZ/luci-app-UUGameAcc.git package/luci-app-UUGameAcc

# rm -rf feeds/packages/lang/golang
# svn export https://github.com/sbwml/packages_lang_golang/branches/20.x feeds/packages/lang/golang

# luci-app-lucky=y 
# git clone https://github.com/firkerword/luci-app-lucky.git package/lucky
git clone  https://github.com/gdy666/luci-app-lucky.git package/lucky
# git clone https://github.com/sirpdboy/luci-app-lucky.git package/lucky
chmod 755 ./package/lucky/luci-app-lucky/root/usr/bin/luckyarch
