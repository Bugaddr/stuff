#!/usr/bin/env bash

# Check Net+Root
if : >/dev/tcp/8.8.8.8/53; then
  echo 'Internet is ok...'
else
  echo 'Offline Please connect...' && exit
fi

# Required stuff list
apps=(
  'aircrack-ng'
  'asleap'
  'bettercap'
  'bully'
  'ccze'
  'crunch'
  'dhcp'
  'dnsmasq'
  'ethtool'
  'ettercap'
  'gawk'
  'hashcat'
  'hashcat-utils'
  'hcxdumptool'
  'hcxtools'
  'hostapd'
  'hostapd-wpe'
  'iproute2'
  'iptables'
  'iw'
  'john'
  'lighttpd'
  'mdk3'
  'mdk4'
  'nftables'
  'openssl'
  'pciutils'
  'pixiewps'
  'procps-ng'
  'reaver'
  'rfkill'
  'tmux'
  'usbutils'
  'wget'
  'xorg-xdpyinfo'
  'xorg-xset'
  'xterm' # wireshark-cli beef
)

# Debloater
for APPP in "${apps[@]}"; do
  paru -S --noconfirm $APPP
done
