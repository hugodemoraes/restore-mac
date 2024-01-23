 #! /bin/bash

clear
echo "Starting common setup 🧞‍♂️"

# Check brew
if ! which brew >/dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew already installed"
fi

# Brew installs
brew install airbuddy \
 arc \
 dozer \
 folx \
 MonitorControl \
 notion \
 raycast \
 rectangle \
 slack \
 spark \
 spotify \
 stats \
 vlc \
 whatsapp \
 1password

# Aldente install
hdiutil attach ./apps/AlDente-Pro.dmg
cp -r /Volumes/AlDente/AlDente.app /Applications/
hdiutil detach /Volumes/AlDente

# Dock settings
defaults write com.apple.Dock showhidden -boolean yes
killall Dock

echo "All set in common setup! 💅"