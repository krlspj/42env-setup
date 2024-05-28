#!/bin/bash
#RC_FILE=.zshrc
RC_FILE=.bashrc

echo ">> update system"
apt-get update && apt-get -y upgrade

echo ">> install packages"
apt-get -y install git xsel python3-pip python3-venv 
apt-get -y install gcc clang libpq-dev libbsd-dev libncurses-dev

cd $HOME

/install-scripts/valgrind.sh

python3 -m venv ./venv

echo ">> to activate python virtual environment: source $HOME/venv/bin/activate"
echo ">> to deactivate: deactivate"

source $HOME/venv/bin/activate
pip3 install --upgrade pip setuptools
pip3 install norminette

echo ">> end update and packages installation"

echo ">> installing francinette"
cd
git clone --recursive https://github.com/xicodomingues/francinette.git francinette
pip3 install -r francinette/requirements.txt

echo ">> installing tmux"
apt-get -y install tmux
echo "setw -g mode-keys vi" >> $HOME/.tmux.conf
echo "alias tmux=\"TERM=xterm-256color tmux\"" >> $HOME/$RC_FILE

echo ">> install and configure neovim for 42"
/install-scripts/neovim_appimage_42.sh

echo ">> add aliases to $RC_FILE"
echo "alias pingu-is-life=\"source $HOME/venv/bin/activate\"" >> $HOME/$RC_FILE
echo "alias mcheck=$HOME/francinette/tester.sh" >> $HOME/$RC_FILE
echo "alias mc=$HOME/francinette/tester.sh" >> $HOME/$RC_FILE

echo "=== INSTRUCTIONS ==="
echo ""
echo ">> pingu-is-life to activate the virtual environment"
echo ">> mcheck or mc to launch francinette"
echo ">> deactivate to close virtual environment"

echo "=== Container Management ==="
echo ""
echo ">> docker exec -it 42bcn-env /bin/bash	// to start an interative shell"
echo ">> docker stop 42bcn-env					// to stop the container"
echo ">> docker restart 42bcn-env				// to start container again"
echo ">> docker compose down					// to remove container and network"

exec $SHELL
