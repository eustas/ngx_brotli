#!/bin/bash

case "$1" in
    "before_install")
	;;
    "install")
	;;
    "script")
		ROOT=`pwd` &&
		git clone https://github.com/nginx/nginx.git &&
		cd $ROOT/script &&
		mkdir test &&
		cd test &&
		mkdir logs &&
		curl --compressed -o war-and-peace2600.txt http://www.gutenberg.org/files/2600/2600-0.txt &&
		cd $ROOT/nginx &&
		./auto/configure --prefix=$ROOT/script/test --add-module=$ROOT/ &&
		make &&
		cd $ROOT &&
		NGINX=$ROOT/nginx/objs/nginx &&
		$NGINX -c $ROOT/script/test.conf &&
		$NGINX -c $ROOT/script/test.conf -s stop
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
