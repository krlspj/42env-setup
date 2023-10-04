#!/bin/bash
echo "check if neovim exists"
echo "install neovim for mac"
MAC_LINK=https://github.com/neovim/neovim/releases/latest/download/nvim-macos.tar.gz
LINUX_LINK=https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz

#wget -P /tmp $MAC_LINK
#tar -xf /tmp/nvim-macos.tar.gz -C /tmp
#wget -P /tmp $LINUX_LINK
tar -xf /tmp/nvim-linux64.tar.gz -C /tmp
# check if path exists. if does, stop process since there can be an already configured neovim
#mv ~/.config/nvim{,.bak}
# optional but recommended
#mv ~/.local/share/nvim{,.bak}
#mv ~/.local/state/nvim{,.bak}
#mv ~/.cache/nvim{,.bak}
#clean nvim

# # required
#rm ~/.config/nvim{,.bak}
# optional but recommended
#rm ~/.local/share/nvim{,.bak}
#rm ~/.local/state/nvim{,.bak}
#rm ~/.cache/nvim{,.bak}
#rm -rf ~/.config/nvim/.git
echo "configure neovim"
echo "COMMAND to remove neovim and its packages"
