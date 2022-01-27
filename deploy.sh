set -e

sudo apt update
sudo apt upgrade -y

sudo apt install -y zsh neovim unzip network-manager rtl8821ce-dkms fd-find

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sh -c "$(curl -fsSL https://starship.rs/install.sh)"
yes
wget https://raw.githubusercontent.com/billykirk01/ubuntu-deploy/main/starship.toml
mv starship.toml ~/.config/

wget https://raw.githubusercontent.com/billykirk01/ubuntu-deploy/main/.zshrc

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

curl -fsSL https://deno.land/install.sh | sh

wget "https://go.dev/dl/$(curl https://go.dev/VERSION\?m\=text).linux-amd64.tar.gz"
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go*linux-amd64.tar.gz

wget https://raw.githubusercontent.com/billykirk01/ubuntu-deploy/main/.vimrc
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo chsh -s $(which zsh) $(whoami)

. .zshrc

cargo install exa

ssh-keygen
