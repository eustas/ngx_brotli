#!/bin/bash

case "$1" in
    "before_install")
	;;
    "install")
	;;
    "script")
		ROOT=`pwd`
		git clone https://github.com/nginx/nginx.git &&
		cd nginx &&
		./auto/configure --add-module=$ROOT/ &&
		make &&
		cd .. &&
		nginx/obj/nginx
	;;
    "after_success")
		killall nginx
	;;
	"after_failure")
		killall nginx
	;;
    "before_deploy")
	;;
esac
