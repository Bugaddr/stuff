#!/usr/bin/env bash

# CHECK ROOT
if [ "$EUID" -ne 0 ]; then
    echo -e "\033[31;5;7mPlease run as root\033[0m" && exit
    if : >/dev/tcp/8.8.8.8/53; then
        echo ''
    else echo 'offline Please connect...' && exit; fi
fi

# some var
export SUSER="${SUDO_USER:-${USER}}"
noroot(){
		sudo -H -u "$SUSER" bash -c "$1"
}

# INSTALL REQUIRED STUFF
paru -S \
    aircrack-ng \
    asleap \
    bettercap \
    bully \
    ccze \
    crunch \
    dhcp \
    dnsmasq \
    ethtool \
    ettercap \
    gawk \
    hashcat \
    hcxdumptool \
    hcxtools \
    hostapd \
    hostapd-wpe \
    iproute2 \
    iptables \
    iw \
    john \
    lighttpd \
    mdk3 \
    mdk4 \
    nftables \
    openssl \
    pciutils \
    pixiewps \
    procps-ng \
    reaver \
    rfkill \
    tmux \
    usbutils \
    wget \
    xorg-xdpyinfo \
    xorg-xset \
    xterm # wireshark-cli beef
