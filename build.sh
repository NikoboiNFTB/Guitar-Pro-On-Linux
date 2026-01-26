#!/usr/bin/env bash
set -e

REPO_DIR="$HOME/GitHub/NikoboiNFTB/Guitar-Pro-On-Linux"
PREFIX="$HOME/Applications/Windows/Guitar-Pro-8"
DESKTOP="$HOME/Desktop"

# Ensure directories exist
mkdir -p "$PREFIX"

# Copy
echo "Updating startup scripts and icon..."
cp -f "$REPO_DIR/startup.sh" "$PREFIX/"
cp -f "$REPO_DIR/icon.png" "$PREFIX/"
cp -f "$REPO_DIR/guitarpro.desktop" "$DESKTOP/"

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

# Install Guitar Pro 8 but check if GP8 is already installed
if [ ! -f "$PREFIX/drive_c/Program Files/Arobas Music/Guitar Pro 8/GuitarPro.exe" ]; then
    echo "Guitar Pro 8 not found. Installing..."
    WINEARCH=win64 WINEPREFIX="$PREFIX" wine "$PREFIX/guitar-pro-8-setup.exe"
else
    echo "Guitar Pro 8 is already installed. Skipping installer."
fi

echo "Guitar Pro 8 setup finished!"
