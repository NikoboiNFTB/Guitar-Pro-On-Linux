#!/usr/bin/env bash
set -e

REPO_DIR="$HOME/GitHub/NikoboiNFTB/Guitar-Pro-On-Linux"
PREFIX="$HOME/wol/Guitar_Pro_8"
DESKTOP="$HOME/Desktop"

# Ensure directories exist
mkdir -p "$PREFIX"

# Copy startup script and icon
cp "$REPO_DIR/startup.sh" "$PREFIX/"
cp "$REPO_DIR/icon.png" "$PREFIX/"

# Copy .desktop to desktop
cp "$REPO_DIR/guitarpro.desktop" "$DESKTOP/"

# Download Guitar Pro 8 installer
cd "$PREFIX"
if [ ! -f guitar-pro-8-setup.exe ]; then
    echo "Downloading Guitar Pro 8..."
    wget -O guitar-pro-8-setup.exe https://download-fr-3.guitar-pro.com/gp8/stable/guitar-pro-8-setup.exe
fi

# Prepare Wine prefix
if [ ! -d "$PREFIX/drive_c" ]; then
    echo "Setting up Wine prefix..."
    WINEARCH=win64 WINEPREFIX="$PREFIX" wineboot --init
    WINEARCH=win64 WINEPREFIX="$PREFIX" winetricks -q win7 corefonts
fi

# Install Guitar Pro 8
echo "Launching Guitar Pro 8 installer..."
WINEARCH=win64 WINEPREFIX="$PREFIX" wine "$PREFIX/guitar-pro-8-setup.exe"

echo "Guitar Pro 8 setup finished!"
