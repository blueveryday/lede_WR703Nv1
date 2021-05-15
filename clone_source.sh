#!/bin/bash

git clone "https://github.com/coolsnowwolf/lede.git"

pushd "lede"; 

sed -i 's/192.168.1.1/192.168.62.1/g' package/base-files/files/bin/config_generate        #修改路由器管理IP地址
sed -i '343s/4/8/g' target/linux/ar71xx/image/tiny-tp-link.mk                             #修改wr703nv1的编译固件大小
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default                                      #使用源码自带ShadowSocksR Plus软件

./scripts/feeds update -a -f
./scripts/feeds install -a -f

popd
