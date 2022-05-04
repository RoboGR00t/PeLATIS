#!/bin/bash

echo " ________  _______   ___       ________  _________  ___  ________      "
echo "|\\   __  \\|\\  ___ \\ |\\  \\     |\\   __  \\|\\___   ___\\\\  \\|\\   ____\\     "
echo "\\ \\  \\|\\  \\ \\   __/|\\ \\  \\    \\ \\  \\|\\  \\|___ \\  \\_\\ \\  \\ \\  \\___|_    "
echo " \\ \\   ____\\ \\  \\_|/_\\ \\  \\    \\ \\   __  \\   \\ \\  \\ \\ \\  \\ \\_____  \\   "
echo "  \\ \\  \\___|\\ \\  \\_|\\ \\ \\  \\____\\ \\  \\ \\  \\   \\ \\  \\ \\ \\  \\|____|\\  \\  "
echo "   \\ \\__\\    \\ \\_______\\ \\_______\\ \\__\\ \\__\\   \\ \\__\\ \\ \\__\\____\\_\\  \\ "
echo "    \\|__|     \\|_______|\\|_______|\\|__|\\|__|    \\|__|  \\|__|\\_________\\"
echo "                                                           \\|_________|"
echo "                                                                       "
echo "------------------------- GEORGIOS ROUMELIOTIS ------------------------"
echo ""
echo ""


if [ $# == 0 ]; then
    echo "usage: $0 {--enable,--disable,--install}"
fi

if [ $# == 1 ]; then

    if [ $1 == "--key" ]; then
        sudo gpg --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6 
        sudo gpg -a --export ED444FF07D8D0BF6 |sudo apt-key add -
        sudo apt-get update
        echo "+---------------------------------+"
        echo "| Kali repositories key is added  |"
        echo "+---------------------------------+"
    fi

    if [ $1 == "--enable" ]; then
        sudo echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" |sudo tee -a /etc/apt/sources.list
        sudo apt-get update >/dev/null
        echo "+---------------------------------+"
        echo "|  Kali repositories are enabled  |"
        echo "+---------------------------------+"
        echo "|Please do NOT upgrade your system|"
        echo "|  while kali repos are enabled   |"
        echo "+---------------------------------+"
    fi

    if [ $1 == "--disable" ]; then
        sudo sed '/kali.org/d' /etc/apt/sources.list | sudo tee -a /etc/apt/sources.list.temp
        sudo mv /etc/apt/sources.list.temp /etc/apt/sources.list
        sudo apt-get update >/dev/null
        echo "+---------------------------------+"
        echo "|  Kali repositories are Disable  |"
        echo "+---------------------------------+"
        echo "| You can upgrade your system now |"
        echo "+---------------------------------+"
    fi

fi

if [ $# -gt 1 ]; then
    if [ $1 == "--install" ]; then
        echo -e "\e[32mENABLING KALI REPO\e[0m"
        sudo echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" |sudo tee -a /etc/apt/sources.list
        sudo apt-get update;
        for i in $@;
        do
            if [ $i != "--install" ]; then
                echo -e "\e[32m[+] INSTALLING $i \e[0m"
                sudo apt-get install $i -y;
            fi
        done
        echo -e "\e[32mDISABLING KALI REPO\e[0m"
        sudo sed '/kali.org/d' /etc/apt/sources.list | sudo tee -a /etc/apt/sources.list.temp
        sudo mv /etc/apt/sources.list.temp /etc/apt/sources.list
        sudo apt-get update;
    fi
fi
