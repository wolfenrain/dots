#!/bin/zsh

git config --global user.name "Jochum van der Ploeg"
git config --global user.email "jochum@vdploeg.net"

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae
brew tap leoafarias/fvm

### Essentials
brew install borders
brew install skhd
brew install sketchybar
brew install yabai
brew install jq
brew install wget
brew install --cask iterm2

### Development
brew install --cask visual-studio-code
brew install ruby
echo 'export PATH="$(brew --prefix)/opt/ruby/bin:$PATH"' >> $HOME/.zshrc
brew install cocoapods
brew link --overwrite cocoapods
brew install fvm
fvm install stable
fvm global stable
brew install node

### Media
brew install --cask google-chrome
brew install --cask spotify
brew install nowplaying-cli
brew install spicetify-cli

### Fonts
brew install --cask sf-symbols
brew install --cask font-sf-mono
brew install --cask font-sf-pro

# Link configs
ln -Fs borders/ ~/.config/borders
ln -Fs sketchybar/ ~/.config/sketchybar
ln -Fs skhd/ ~/.config/skhd
ln -Fs spicetify/ ~/.config/spicetify
ln -Fs yabai/ ~/.config/yabai
cp vscode/settings.json cp ~/Library/Application\ Support/Code/User/settings.json
cp vscode/state.vscdb ~/Library/Application\ Support/Code/User/globalStorage/state.vscdb
cat vscode/extensions.txt | while read line; do
    /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension $line
done

# Start Services
echo "Starting Services (grant permissions)..."
skhd --start-service
yabai --start-service
brew services start sketchybar
brew services start borders

# Configure Spotify
spicetify backup apply enable-devtools
spicetify config current_theme RosePine
spicetify config color_scheme rose-pine-moon
spicetify apply

source $HOME/.zshrc

mkdir -p ~/.config/borders && ln -Fs borders/bordersrc ~/.config/borders/bordersrc

csrutil status
echo "(optional) Disable SIP for advanced yabai features."
echo "(optional) Add sudoer manually:\n '$(whoami) ALL = (root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | awk "{print \$1;}") $(which yabai) --load-sa' to '/private/etc/sudoers.d/yabai'"
echo "Installation complete...\n"
