#!/bin/bash
red='\e[1;31m'
# Detect if user pressing Ctrl+C
trap ctrl_c INT
function ctrl_c() {
	echo ""
	clear
	echo -e "[!] Ctrl+C detected! Interrupting..."
	sleep 1
	rm dl.py > /dev/null 2>&1
	rm banner.py > /dev/null 2>&1
	echo ""
	exit
}
menu() {
    echo """
  ███████████████████████████████████████████████████
  █▄─▄▄─██▀▄─██▄─▀█▄─▄█▄─▄▄─█▄─▄▄▀███▄─▄█─▄▄▄─█─▄─▄─█
  ██─▄▄▄██─▀─███─█▄▀─███─▄▄▄██─▄─▄█─▄█─██─███▀███─███
  ▀▄▄▄▀▀▀▄▄▀▄▄▀▄▄▄▀▀▄▄▀▄▄▄▀▀▀▄▄▀▄▄▀▄▄▄▀▀▀▄▄▄▄▄▀▀▄▄▄▀▀

  Flash Samsung Devices with Termux app                    
              1. Flash TWRP                    
              2. Exit                          """
}


banner () {
echo """
  ███████████████████████████████████████████████████
  █▄─▄▄─██▀▄─██▄─▀█▄─▄█▄─▄▄─█▄─▄▄▀███▄─▄█─▄▄▄─█─▄─▄─█
  ██─▄▄▄██─▀─███─█▄▀─███─▄▄▄██─▄─▄█─▄█─██─███▀███─███
  ▀▄▄▄▀▀▀▄▄▀▄▄▀▄▄▄▀▀▄▄▀▄▄▄▀▀▀▄▄▀▄▄▀▄▄▄▀▀▀▄▄▄▄▄▀▀▄▄▄▀▀
"""
}

menu | lolcat
read -p $'\e[1;77m root@panprjct_odin:> \e[0m' choice 
case $choice in
    1)
   while true; do
        clear
        pan detect | grep -e "Device detected"
        if [ $? -eq 0 ]; then
            echo ""
                              sleep 3
            break
        else
            echo ""
echo "#!/usr/bin/python3
import sys, time
def sprint(str):
  for c in str + '\n':
    sys.stdout.write(c)
    sys.stdout.flush()
    time.sleep(0.100)
sprint ('Menunggu device terhubung....')" > dl.py
python3 dl.py | lolcat
rm dl.py > /dev/null 2>&1
            #sleep 1
                              clear
        fi
    done
    clear
    banner | lolcat
echo "#!/usr/bin/python3
import sys, time
def sprint(str):
  for c in str + '\n':
    sys.stdout.write(c)
    sys.stdout.flush()
    time.sleep(0.100)
sprint ('Follow @panxdprjct')" > banner.py
python3 banner.py | lolcat
rm banner.py > /dev/null 2>&1
    echo ""
    read -p $'\e[1;92m Kamu yakin untuk melanjutkan y/n' jawab;
    if [[ $jawab = "y" ]]; then
        clear
        banner | lolcat
        read -p $'\e[1;92m Masukan Directory File TWRP:' folder;
        echo ""
        pan flash --RECOVERY $folder --no-reboot | grep -E -w "successful|ERROR"
    else
        exit
    fi
    ;;
    2)
    exit
    ;;
    *)
    clear
    echo "Pilihan Salah. Coba Lagi."
    sleep 2
    ;;
esac