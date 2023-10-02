#!/bin/bash
echo "check if neovim exists"
echo "install neovim for mac"
MAC_LINK=https://github.com/neovim/neovim/releases/latest/download/nvim-macos.tar.gz
LINUX_LINK=https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz

#wget -P /tmp $MAC_LINK
#tar -xf /tmp/nvim-macos.tar.gz -C /tmp
#wget -P /tmp $LINUX_LINK
tar -xf /tmp/nvim-linux64.tar.gz -C /tmp

# # required
#mv ~/.config/nvim{,.bak}
# optional but recommended
#mv ~/.local/share/nvim{,.bak}
#mv ~/.local/state/nvim{,.bak}
#mv ~/.cache/nvim{,.bak}
echo "configure neovim"
echo "COMMAND to remove neovim and its packages"
