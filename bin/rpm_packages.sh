#!/bin/bash

# Define an array of packages to install
packages=(
    "stow"
    "ffmpeg"
    "ffmpeg-libs"
    "python3-pip"
    "zsh"
    "exa"
    "neovim"
    "fd-find"
    "man"
    "net-tools"
    "kitty"
    "tree"
    "whois"
    "bpytop"
    "bat"
    "gh"
    "iproute"
    "fzf"
    "unzip"
    "zathura"
    "zathura-pdf-mupdf"
    "zathura-zsh-completion"
    "ffmpegthumbnailer"
    "fastfetch"
    "micro"
    "nano"
    "miktex"
    "tldr"
    "perl-libwww-perl"
    "perl-LWP-Protocol-https"
    "perl-Data-Dump"
    "perl-JSON"
    "perl-Term-ReadLine"
    "perl-FindBin"
    "perl-Memoize"
    "perl-Time-Piece"
)

# Add RPM Fusion repositories if not already added
echo "Enabling RPM Fusion repositories..."
sudo dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Update package database
echo "Running update..."
sudo dnf update -y

# Install the packages
echo "Installing packages..."
sudo dnf install -y "${packages[@]}"

# Clean up cached files
echo "Cleaning up..."
sudo dnf clean all

echo "Installation complete."
