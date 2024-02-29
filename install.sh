#!/bin/bash

if [ ! -z "$(/system/bin/ps -A | grep -v grep | grep -c daemonsu)" ]; then
	uname -r | grep -e "4." > /dev/null 2>&1
	if [ "$?" -eq "0" ]; then
		apt update
		apt-get --assume-yes install tsu python3 ruby curl
		gem install lolcat
		mv .bin/kernel/pan /data/data/com.termux/files/usr/bin/ > /dev/null 2>&1
	else
		echo -e "Kernel Belum Support"
		exit
	fi
else
	echo -e "Tools harus dijalankan dengan root" 
	exit
fi