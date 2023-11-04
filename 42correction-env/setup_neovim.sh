#!/bin/bash
echo "check if neovim exists"
echo "install neovim for mac"
MAC_LINK=https://github.com/neovim/neovim/releases/download/v0.9.2/nvim-macos.tar.gz
LINUX_LINK=https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
RC_FILE=.zshrc
NEOVIM_CONFIG_DIR="$HOME/.config/nvim"
DOWNLOAD_LINK=""
sys_name=""
file_name=""

# Get the system name
os_name=$(uname -s)

# Check if it's Linux or Darwin
if [ "$os_name" == "Linux" ]; then
	sys_name="Linux"
	file_name="nvim-linux64"
	DOWNLOAD_LINK=$LINUX_LINK

elif [ "$os_name" == "Darwin" ]; then
	sys_name="macOS"
	file_name="nvim-macos"
	DOWNLOAD_LINK=$MAC_LINK
else
    sys_name="Unknown"
	file_name="nvim-macos"
	DOWNLOAD_LINK=$MAC_LINK
fi
# Now you can use the sys_name variable outside the if statement
echo "Detected operating system: $sys_name"

if command -v nvim &> /dev/null; then
    echo "neovim already exists in this system, exit process, and system's user permission"
    exit 1
else
    echo "Neovim is not installed. Install it first."
fi

if [ -d "$NEOVIM_CONFIG_DIR" ]; then
    echo "The ~/.config/nvim folder already exists. Exiting the script."
    exit 1
else
    echo "The ~/.config/nvim folder does not exist. Continuing..."
fi

# Directories to check
directories=("$HOME/.config/nvim" "~$HOME/.local/share/nvim" "~$HOME/.local/state/nvim" "$HOME/.cache/nvim")

# Check if any directory exists
for dir in "${directories[@]}"; do
    if [ -d "$dir" ]; then
        echo "One of the directories already exists: $dir"
        exit 1  # Exit the script with an error code
    fi
done

# Continue with the rest of your script if no directories exist
echo "No existing directories found. Proceeding with the script."



wget -P /tmp $DOWNLOAD_LINK
tar -xf /tmp/$file_name.tar.gz -C /tmp
echo "alias nvim=/tmp/$file_name/bin/nvim" >> ~/$RC_FILE

mkdir -p $HOME/.config

cd ~/.config
git clone https://github.com/krlspj/nvim-config.git nvim
cd nvim
git checkout develop_42

# add alias function to remove aliases
#kr-fclean 
echo 'alias kr_fclean='"'"'
# Remove the remove_stuff alias and associated commands from .zshrc
sed -i "/^alias kr_fclean=/,/^eofkr_fclean$/d" ~/.zshrc
sed -i "/^alias nvim=\/tmp\/nvim-/d" ~/.zshrc

# Remove ~/.config/nvim, ~/.local/share/nvim, ~/.local/state/nvim, ~/.cache/nvim
rm -rf $HOME/.config/nvim $HOME/.local/share/nvim $HOME/.local/state/nvim $HOME/.cache/nvim
rm -rf /tmp/nvim*

# Save the changes to .zshrc
#source ~/.zshrc
#eofkr_fclean'"'" >> ~/$RC_FILE

exec $SHELL

echo "run kr_fclean to remove neovim and its configuration"
