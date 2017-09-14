#!/bin/bash

export https_proxy=http://dummyid:dummypass@136.18.66.239:83
export http_proxy=http://dummyid:dummypass@136.18.66.239:83
export HTTP_PROXY=http://dummyid:dummypass@136.18.66.239:83
export HTTPS_PROXY=http://dummyid:dummypass@136.18.66.239:83

echo 'Acquire::http::proxy "http://dummyid:dummypass@136.18.66.239:83/";
Acquire::https::proxy "http://dummyid:dummypass@136.18.66.239:83/";
Acquire::ftp::proxy "ftp://dummyid:dummypass@136.18.66.239:83/";' > /etc/apt/apt.conf.d/99proxies

