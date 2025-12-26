DOTFILES_DIRECTORY_PATH=~/.dotfiles

sudo apt update -y
sudo apt install curl zsh git fzf stow -y

git clone https://github.com/XavierDupuis/dotfiles.git $DOTFILES_DIRECTORY_PATH
cd $DOTFILES_DIRECTORY_PATH
stow .
cd -

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

chsh -s $(which zsh)
zsh