# Configure VSCode
cp vscode/settings.json cp ~/Library/Application\ Support/Code/User/settings.json
cp vscode/state.vscdb ~/Library/Application\ Support/Code/User/globalStorage/state.vscdb
cat vscode/extensions.txt | while read line; do
    /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension $line
done

# Configure Spotify
spicetify backup apply enable-devtools
spicetify config current_theme RosePine
spicetify config color_scheme rose-pine-moon
spicetify apply