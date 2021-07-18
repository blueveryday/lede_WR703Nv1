#!/bin/bash

git clone "https://github.com/coolsnowwolf/lede.git"

pushd "lede"; 

sed -i -e 's/192.168.1.1/192.168.3.1/g' -e 's/OpenWrt/TPLink_WR703Nv1/g' package/base-files/files/bin/config_generate  #修改路由器管理IP地址和主机名
sed -i '343s/4/8/g' target/linux/ar71xx/image/tiny-tp-link.mk  #修改wr703nv1的编译固件大小
sed -i -e 's/OpenWrt/TPLink_WR703Nv1/g' -e 's/encryption=none/encryption=psk2/g' -e '/psk2/a\			set wireless.default_radio${devidx}.key=password' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# 修改WiFi名称,添加加密方式和密码

sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default                                      #使用源码自带ShadowSocksR Plus软件
sed -i -e '1s/$/^e82d730/g' feeds.conf.default
sed -i -e '2s/$/^974fb04/g' feeds.conf.default
sed -i -e '3s/$/^54fd237/g' feeds.conf.default
sed -i -e '4s/$/^2071d9f/g' feeds.conf.default

./scripts/feeds update -a -f
./scripts/feeds install -a -f

popd
