#!/usr/bin/env bash
set -e

PREFIX="$HOME/wol/Guitar_Pro_8"

WINEARCH=win64 WINEPREFIX="$PREFIX" wine "$PREFIX/drive_c/Program Files/Arobas Music/Guitar Pro 8/GuitarPro.exe"
