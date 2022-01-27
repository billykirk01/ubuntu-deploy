# ubuntu-deploy

## Automated

```sh
curl -fsSL https://raw.githubusercontent.com/billykirk01/ubuntu-deploy/main/deploy.sh | sh
```

## Manual

Update packages
```sh
sudo apt update && sudo apt upgrade -y
```

Install additional packages
```sh
sudo apt install -y zsh neovim unzip network-manager rtl8821ce-dkms fd-find
```

Install oh-my-zsh
```sh
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.shn | sh
```

Install Starship Prompt

```sh
curl -fsSL https://starship.rs/install.sh | sh -s -y
wget https://raw.githubusercontent.com/billykirk01/ubuntu-deploy/main/starship.toml
mv starship.toml ~/.config/
```

Download `.zshrc`
```sh
wget -O https://raw.githubusercontent.com/billykirk01/ubuntu-deploy/main/.zshrc
```

Download `.vimrc`
```sh
wget https://raw.githubusercontent.com/billykirk01/ubuntu-deploy/main/.vimrc
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
```

Install vim-plug
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Install Rust
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Install exa
```sh
cargo install exa
```

Install Deno
```sh
curl -fsSL https://deno.land/install.sh | sh
```

Install Go
```sh
wget "https://go.dev/dl/$(curl https://go.dev/VERSION\?m\=text).linux-amd64.tar.gz"
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go*linux-amd64.tar.gz
```

Source the `.zshrc`
```sh
source .zshrc
```

Generate ssh keys
```sh
ssh-keygen
```
