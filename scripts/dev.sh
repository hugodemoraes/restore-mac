#! /bin/bash

clear
echo "Starting dev setup 👨‍💻"

# Brew taps
brew tap homebrew/cask-fonts
brew tap AdoptOpenJDK/openjdk

# Brew installs
brew install nvm \
yarn \
cocoapods \
watchman \
imagemagick \
pyenv \
fastlane \
figma \
fig \
sourcetree \
postman \
visual-studio-code \
android-studio \
reactotron \
font-fira-code \
flutter \
iterm2 \
zsh \
adoptopenjdk

# Setup Node
nvm install node
nvm alias default node

# Setup Pyenv
pyenv install 3.11.3
pyenv global 3.11.3
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

# XCode
mas install 497799835 # Xcode
xcode-select --install
xcode-select --switch /Applications/Xcode.app

# yarn global packages
yarn global add yalc

echo "Fixing the damn PATH"


# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Fix husky prehooks
echo "export PATH="$(dirname $(which node)):$PATH"" > ~/.huskyrc

# Add NVM to zshrc
cat << EOF >> ~/.zshrc
# NVM
export NVM_DIR=~/.nvm
source \$(brew --prefix nvm)/nvm.sh
export ANDROID_HOME=/Users/mikeamaral/Library/Android/sdk
export PATH=\$PATH:\$ANDROID_HOME/platform-tools
export PATH=\$PATH:\$ANDROID_HOME/tools
export PATH=\$PATH:\$ANDROID_HOME/tools/bin
export PATH=\$PATH:\$ANDROID_HOME/emulator
EOF

# source zshrc
source ~/.zshrc

# End
echo "Dev setup finished! ✅"
