#! /bin/bash

clear
echo "💻 => Starting dev setup"

# Check brew
if ! which brew >/dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed"
fi

# Brew taps
brew tap homebrew/cask-fonts

# Brew installs
brew install android-studio \
  cocoapods \
  fastlane \
  figma \
  flipper \
  font-cascadia-code \
  font-fira-code \
  mas \
  microsoft-teams \
  n \
  openfortivpn \
  openjdk@11 \
  postman \
  pyenv \
  visual-studio-code \
  warp \
  watchman \
  yarn

# Setup JDK 11
echo 'export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"' >> ~/.zshrc

# Add NVM and ANDROID_HOME to zshrc
cat << EOF >> ~/.zshrc
# ANDROID
export ANDROID_HOME=\$HOME/Library/Android/sdk
export PATH=\$PATH:\$ANDROID_HOME/platform-tools
export PATH=\$PATH:\$ANDROID_HOME/tools
export PATH=\$PATH:\$ANDROID_HOME/tools/bin
export PATH=\$PATH:\$ANDROID_HOME/emulator
EOF

# Source zshrc
source ~/.zshrc

# Setup Node
export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

n lts

# Yarn global packages
yarn global add yalc \
  firebase-tools

# Setup Pyenv
pyenv install 3.11.3
pyenv global 3.11.3
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

echo "Fixing the damn PATH"

# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# XCode
mas install 497799835 # Xcode
xcode-select --install
sudo xcodebuild -license accept
xcode-select --switch /Applications/Xcode.app

mas install 937984704 # Amphetamine

# End
echo "Dev setup finished! ✅"
