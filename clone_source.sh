#!/bin/bash

git clone "https://gitee.com/blueveryday/lede.git"
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
pushd "lede"; ./scripts/feeds update -a; ./scripts/feeds install -a; popd
