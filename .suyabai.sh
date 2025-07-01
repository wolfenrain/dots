SHA256=$(shasum -a 256 /opt/homebrew/bin/yabai | awk "{print \$1;}")
if [ -f "/private/etc/sudoers.d/yabai" ]; then
    sudo sed -i '' -e 's/sha256:[[:alnum:]]*/sha256:'${SHA256}'/' /private/etc/sudoers.d/yabai
else
    echo "$(whoami) ALL=(root) NOPASSWD: sha256:${SHA256} $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai
fi
