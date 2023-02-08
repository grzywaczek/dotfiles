#!/bin/sh

echo "Setting up your Mac..."

echo "Installing fonts"
cp -R $HOME/.dotfiles/fonts/ ~/Library/Fonts/

echo "Installing Rossetta"
softwareupdate --install-rosetta

echo "Installing XCode"
xcode-select --install

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  echo "Installing Oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "Installing Powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.dotfiles/powerlevel10k

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew (ARM)"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

echo "Update Homebrew recipes"
/opt/homebrew/bin/brew update

echo "Installing all our dependencies with bundle..."
/opt/homebrew/bin/brew tap homebrew/bundle
/opt/homebrew/bin/brew bundle --file=$HOME/.dotfiles/Brewfile
brew link --force --overwrite shivammathur/php/php@8.1

echo "Installing composer"
brew install composer

echo "Install node using nvm"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
nvm install 14

echo "Install yarn using npm"
npm -g install yarn

#echo "Set default MySQL root password and auth type"
#mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'poiu4014'; FLUSH PRIVILEGES;"

echo "Installing global Composer packages"
composer global require laravel/valet beyondcode/expose

echo "Installing Laravel Valet"
$HOME/.composer/vendor/bin/valet install

echo "Creating directories for projects"
mkdir $HOME/evionica

echo "Cloning repositories"
./$HOME/.dotfiles/clone.sh

echo "Configuring system..."
# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Setting up git 
git config --global user.email "a.grzywacz@evionica.com"
git config --global user.name "Anna Grzywacz"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"
git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.func       "146 bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

# Set macOS preferences - we will run this last because this will reload the shell
source $HOME/.dotfiles/.macos
