#!/bin/bash

git clone "https://github.com/coolsnowwolf/lede.git"

sed -i 's/192.168.1.1/192.168.62.1/g' package/base-files/files/bin/config_generate

sed -i '343s/4/8/g' target/linux/ar71xx/image/tiny-tp-link.mk

sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default  #使用源码自带ShadowSocksR Plus+出国软件

pushd "lede"; ./scripts/feeds update -a -f; ./scripts/feeds install -a -f; popd
