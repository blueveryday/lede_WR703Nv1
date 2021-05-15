#!/bin/bash

git clone "https://gitee.com/blueveryday/lede.git"
pushd "lede"; ./scripts/feeds update -a; ./scripts/feeds install -a; popd
