⚠️ **ALPHA BUILD** ⚠️

# *Guitar Pro 8* on Linux

Install *Guitar Pro 8* on Linux through Wine and Wineget.

Note: This is a full rework of the forked repository. It only uses the core install functionality from it.

Another note: This is built and tested for **Linux Mint / Cinnamon**. Other distros are not officially supported, but feel free to open up an issue for other distros.

## Usage

How to use the scripts.

### Installation

Run the [`install`](https://github.com/NikoboiNFTB/Guitar-Pro-On-Linux/raw/refs/heads/main/install) script.

To install, run:

```bash
bash <(wget -qO- https://nikoboinftb.github.io/shell/gp8/install)
```

It will clone/update this repository locally, allowing for easy file copying.

The [`install`](https://github.com/NikoboiNFTB/Guitar-Pro-On-Linux/raw/refs/heads/main/install) script runs the [`build`](https://github.com/NikoboiNFTB/Guitar-Pro-On-Linux/raw/refs/heads/main/build) script automatically, which actually builds the app.

### Updating

Running [`build`](https://github.com/NikoboiNFTB/Guitar-Pro-On-Linux/raw/refs/heads/main/build) or the command above again will fully re-install *Guitar Pro 8* from scratch and should update all included files from this repository.

### Reset

> Worked for a day, then just stopped working. Troubleshooting.

The [`reset`](https://github.com/NikoboiNFTB/Guitar-Pro-On-Linux/raw/refs/heads/main/reset) script will wipe the registry and config files of the installation. This is useful if Guitar Pro "breaks" (*wink, wink*).

This repo also includes a [`reset.bat`](https://github.com/NikoboiNFTB/Guitar-Pro-On-Linux/raw/refs/heads/main/reset.bat), for Windows.

## Bonus Tip

You can set the desktop icon to run both the reset and the startup scripts. Simply change:

```text
Exec=$HOME/Applications/Windows/Guitar-Pro-8/startup
```

to:

```text
Exec=$HOME/Applications/Windows/Guitar-Pro-8/reset-and-startup
```

Note. It **cannot** literally say "$HOME", that does not work. Use your home directory. To find out what your home directory is, run:

```bash
echo "$HOME"
```

And use that in place of $HOME.

## Contributing

Feel free to fork this repository and submit issues or pull requests if you have any suggestions or improvements. If you encounter any bugs or have feature requests, please open an issue.

## Credits

Original repository created by **[Windows-On-Linux](https://github.com/Windows-On-Linux/)**

Forked and upgraded by **[Nikoboi](https://github.com/NikoboiNFTB/)**

[Disclaimer](#legal-disclaimer) coughed up by **[ChatGPT](https://chatgpt.com/)**

## License

I don't know what LICENSE this is under. The original repository is LICENSE-less.

## Legal Disclaimer

**Guitar-Pro-On-Linux** is provided “as-is” and for educational or personal use only. By using this project, you acknowledge and agree to the following:

1. **No Official Affiliation**

    This project is **not affiliated with, endorsed by, or sponsored by Arobas Music or Guitar Pro**. All trademarks, logos, and software referenced herein remain the property of their respective owners.

2. **User Responsibility**

    You are responsible for obtaining a **legally licensed copy of *Guitar Pro 8***. This project does **not distribute Guitar Pro** or any other proprietary software.

    *Guitar Pro 8* is downloaded and installed from the official [guitar-pro.com](https://www.guitar-pro.com/) website.

3. **No Warranty**

    This project comes with **no warranty of any kind**, express or implied. The author(s) disclaim all liability for damages, data loss, or system issues resulting from the use of this software or scripts.

4. **Use at Your Own Risk**

    Running Wine, downloading installers, and modifying system files may cause unexpected behavior. **Use at your own risk**. The author(s) are not responsible for any problems caused to your system, files, or software environment.

5. **Open Source Components**

    Scripts, templates, and other files included in this repository are released under their respective licenses. Use and modification are subject to those licenses.

By using this project, you confirm that you understand and accept these terms.
