sudo apt install nala -y

echo "deb https://mirror.kapteyan.com.tr/ubuntu/ jammy main restricted universe multiverse" | sudo tee /etc/apt/sources.list.d/nala-sources.list
echo "deb http://ubuntu.vargonen.com/ubuntu/ jammy main restricted universe multiverse" | sudo tee /etc/apt/sources.list.d/nala-sources.list
echo "deb https://kozyatagi.mirror.guzel.net.tr/ubuntu/ jammy main restricted universe multiverse" | sudo tee /etc/apt/sources.list.d/nala-sources.list
echo "deb https://mirror.dogado.de/ubuntu/ jammy main restricted universe multiverse" | sudo tee /etc/apt/sources.list.d/nala-sources.list

sudo nala install git curl -y

wget https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb
sudo dpkg -i freedownloadmanager.deb
rm freedownloadmanager.deb

curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo nala update && sudo nala install brave-browser spotify-client

echo "dotfiles" >> .gitignore
git clone --bare git@github.com:ergulfaruk/dotfiles.git $HOME/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
