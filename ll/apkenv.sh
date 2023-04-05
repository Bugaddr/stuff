#!/usr/bin/env bash

set -e

# Update Pkgs [EXTRAPKG: cmake ninja-build golang]
sudo apt update -y
#sudo apt upgrade -y
sudo apt install openjdk-8-jdk git python3 unzip -y
sudo apt autoremove -y

# Temp Env Variables
export CMDLT="$(curl -sSL 'https://developer.android.com/studio#downloads' | grep 'commandlinetools-linux' | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" | sort -u)"
export ANDROID_ROOT="$PWD/ASDK"
export ANDROID_SDK_ROOT="$ANDROID_ROOT/sdk"
export ANDROID_NDK_ROOT="$ANDROID_SDK_ROOT/ndk-bundle"
export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"

# Permanent Env Variables [EXTRAENV: NINJA_PATH="$(which ninja)"]
if grep -q 'ANDROID_SDK_ROOT' ~/.bashrc; then
	true
else
	echo -e '\nexport ANDROID_ROOT="$PWD/ASDK"' >>~/.bashrc
	echo -e 'export ANDROID_SDK_ROOT="$ANDROID_ROOT/sdk"' >>~/.bashrc
	echo -e 'export ANDROID_NDK_ROOT="$ANDROID_SDK_ROOT/ndk-bundle"' >>~/.bashrc
	echo -e 'export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"' >>~/.bashrc
fi

# Download and setup cmdlinetools
mkdir -p -m777 "$ANDROID_SDK_ROOT"/cmdline-tools/latest
curl -LO "$CMDLT"
unzip -qq commandlinetools-linux*.zip
mv cmdline-tools/* "$ANDROID_SDK_ROOT"/cmdline-tools/latest
rm -rf ./commandlinetools-linux*.zip ./cmdline-tools

# Install Android ndk
yes | sdkmanager --licenses || true
yes | sdkmanager ndk-bundle

# Delete script itself CREDIT: https://brakertech.com/self-deleting-bash-script/
echo 'Deleting script' && sleep 1
rm -rf "$0" || exit
