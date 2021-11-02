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
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

echo "Installing Powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.dotfiles/powerlevel10k

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew (ARM)"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "Installing Homebrew (Intel)"
  arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/homebrew/bin:/usr/local/homebrew/sbin:$PATH"

echo "Update Homebrew recipes"
brew update
arch -x86_64 /usr/local/homebrew/bin/brew update

echo "Installing all our dependencies with bundle..."
brew tap homebrew/bundle
brew bundle
arch -x86_64 /usr/local/homebrew/bin/brew tap homebrew/bundle
arch -x86_64 /usr/local/homebrew/bin/brew bundle

echo "Install node using nvm"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
nvm install 14

echo "Install yarn using npm"
npm -g install yarn

echo "Set default MySQL root password and auth type"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'poiu4014'; FLUSH PRIVILEGES;"

echo "Installing PHP extensions with PECL"
pecl install imagick redis swoole

echo "Installing global Composer packages"
/usr/local/bin/composer global require laravel/installer laravel/valet beyondcode/expose
/usr/local/bin/composer global require laravel/vapor-cli --update-with-dependencies

echo "Installing Laravel Valet"
$HOME/.composer/vendor/bin/valet install

echo "Creating directories for projects"
mkdir $HOME/rywal
mkdir $HOME/broda
mkdir $HOME/grixu

echo "Cloning Github repositories"
./clone.sh

echo "Configuring system..."
# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Setting up git 
git config --global user.email "mateusz.gostanski@gmail.com"
git config --global user.name "Mateusz Gostański"
git config --global init.defaultBranch main
git config --global pull.rebase false

# Set macOS preferences - we will run this last because this will reload the shell
source .macos
