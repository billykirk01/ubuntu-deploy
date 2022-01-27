set -e

# upgrade packages
sudo apt update
sudo apt upgrade -y

# install additional packages
sudo apt install -y zsh neovim unzip network-manager build-essential fd-find

# install networking package if this is on GK55
if [ "$(lspci -nnk | grep 0280)" = *RTL8821CE* ]; then 
  sudo apt install -y rtl8821ce-dkms
fi

# install oh-my-zsh and zsh-autosuggestions
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
wget https://raw.githubusercontent.com/billykirk01/ubuntu-deploy/main/.zshrc -O .zshrc
sudo chsh -s $(which zsh) $(whoami)

# set up vimrc and neovim
wget https://raw.githubusercontent.com/billykirk01/ubuntu-deploy/main/.vimrc
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. ~/.cargo/env
cargo install exa

# install starship prompt
curl -fsSL https://starship.rs/install.sh | sh -s -- -y
wget https://raw.githubusercontent.com/billykirk01/ubuntu-deploy/main/starship.toml
mv starship.toml ~/.config/

# install go
wget "https://go.dev/dl/$(curl https://go.dev/VERSION\?m\=text).linux-amd64.tar.gz"
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go*linux-amd64.tar.gz && rm -f go*linux-amd64.tar.gz

# install deno
curl -fsSL https://deno.land/install.sh | sh
