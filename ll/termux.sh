#!/usr/bin/env bash

# INSTALL
pkg update -y
pkg upgrade -y
pkg install -y root-repo x11-repo

# FAV
pkg install -y ripgrep fd aria2 git pacman

# FUCK
termux-setup-storage
termux-change-repo

# Python
apt install python -y
python3 -m pip install --upgrade pip

# Bin
mkdir -pv ~/.local/bin
curl -L https://github.com/Jrchintu/pastebin-worker/raw/master/scripts/pb -o ~/.local/bin/pb
chmod a+x ~/.local/bin/pb

# Php
apt install php7
curl -L https://cs.symfony.com/download/php-cs-fixer-v3.phar -o php-cs-fixer
chmod a+x php-cs-fixer
mv php-cs-fixer ~/.local/bin/php-cs-fixer

