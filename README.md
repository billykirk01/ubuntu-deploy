# ubuntu-deploy

## Automated

```sh
curl -fsSL https://raw.githubusercontent.com/billykirk01/ubuntu-deploy/main/deploy.sh | sh
```

## Manual

Update packages
```sh
sudo apt update
sudo apt upgrade -y
```

Install additional packages
```sh
sudo apt install -y zsh neovim unzip network-manager build-essential fd-find
```

Install oh-my-zsh and zsh-autosuggestions and set up `.zshrc`
```sh
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
wget https://raw.githubusercontent.com/billykirk01/ubuntu-deploy/main/.zshrc -O .zshrc
chsh -s $(which zsh)
zsh
```

Setup `.vimrc` and vim-plug
```sh
wget https://raw.githubusercontent.com/billykirk01/ubuntu-deploy/main/.vimrc
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Install rust and exa
```sh
wget https://raw.githubusercontent.com/billykirk01/ubuntu-deploy/main/.zshrc -O .zshrc
cargo install exa
```

Install starship prompt
```sh
curl -fsSL https://starship.rs/install.sh | sh -s -- -y
wget https://raw.githubusercontent.com/billykirk01/ubuntu-deploy/main/starship.toml
mv starship.toml ~/.config/
```

Install go
```sh
wget "https://go.dev/dl/$(curl https://go.dev/VERSION\?m\=text).linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go*linux-amd64.tar.gz
rm -f go*linux-amd64.tar.gz
```

Install deno
```sh
curl -fsSL https://deno.land/install.sh | sh
```

Generate ssh keys
```sh
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
```

## WiFi setup (optional)

Modify networks settings (optional) to make boot time faster
```sh
sudo vim /etc/netplan/<some file>.yaml

# This is the network config written by 'subiquity'
network:
  ethernets:
    enp1s0:
      dhcp4: true
      optional: true
    enp2s0:
      dhcp4: true
      optional: true
  version: 2
```

Install additional drives if necessary (like this driver for the wifi card on my GK55.
```sh
sudo apt install -y rtl8821ce-dkms
sudo reboot
```

Join a wifi network (optional)
```
sudo nmcli dev wifi connect <ssid> password <password>
```
