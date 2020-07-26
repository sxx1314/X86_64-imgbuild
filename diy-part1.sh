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
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default


sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3.5 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget swig rsync

git clone https://github.com/jerrykuku/lua-maxminddb.git package/my/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package/my/luci-app-vssr
git clone https://github.com/asushugo/luci-app-koolproxyR.git package/my/luci-app-koolproxyR
git clone https://github.com/skyformat99/eqos.git package/my/eqos
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/my/luci-app-adguardhome
git clone https://github.com/honwen/luci-app-aliddns.git package/my/luci-app-aliddns
git clone https://github.com/frainzy1477/luci-app-clash.git package/my/luci-app-clash
git clone https://github.com/lisaac/luci-app-diskman.git package/my/luci-app-diskman
git clone https://github.com/lisaac/luci-app-dockerman.git package/my/luci-app-dockerman
git clone https://github.com/tty228/luci-app-serverchan.git package/my/luci-app-serverchan
git clone https://github.com/lisaac/luci-lib-docker.git package/my/luci-lib-docker
git clone https://github.com/Leo-Jo-My/luci-theme-argon-dark-mod.git package/my/luci-theme-argon-dark-mod
git clone https://github.com/Leo-Jo-My/luci-theme-argon-mod.git package/my/luci-theme-argon-mod
git clone https://github.com/Leo-Jo-My/luci-theme-Butterfly.git package/my/luci-theme-Butterfly
git clone https://github.com/Leo-Jo-My/luci-theme-Butterfly-dark.git package/my/luci-theme-Butterfly-dark
git clone https://github.com/Leo-Jo-My/luci-theme-leo.git package/my/luci-theme-leo
git clone https://github.com/Leo-Jo-My/luci-theme-opentomato.git package/my/luci-theme-opentomato
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/my/luci-theme-opentomcat
git clone https://github.com/vernesong/OpenClash.git package/my/OpenClash
git clone https://github.com/ElonH/Rclone-OpenWrt.git package/my/Rclone-OpenWrt
git clone https://github.com/kenzok8/openwrt-packages.git package/my/openwrt-packages
git clone https://github.com/kenzok8/small.git package/my/small
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git
mkdir -p package/my/parted && \
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/my/parted/Makefile


echo "
src-git packages https://github.com/coolsnowwolf/packages
src-git luci https://github.com/coolsnowwolf/luci
src-git routing https://git.openwrt.org/feed/routing.git
src-git telephony https://git.openwrt.org/feed/telephony.git
src-git freifunk https://github.com/freifunk/openwrt-packages.git
#src-git video https://github.com/openwrt/video.git
#src-git targets https://github.com/openwrt/targets.git
#src-git management https://github.com/openwrt-management/packages.git
#src-git oldpackages http://git.openwrt.org/packages.git
#src-link custom /usr/src/openwrt/custom-feed
src-git helloworld https://github.com/fw876/helloworld
src-git lienol https://github.com/Lienol/openwrt-package
"  > feeds.conf.default



./scripts/feeds update -a
./scripts/feeds install -a

