#!/bin/bash

git clone "https://gitee.com/blueveryday/lede.git"
pushd "lede"; ./scripts/feeds update -a -f; ./scripts/feeds install -a -f; popd
