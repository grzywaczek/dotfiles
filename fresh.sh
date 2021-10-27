#!/bin/sh

echo "Setting up your Mac..."

echo "Installing fonts"
cp -R $HOME/.dotfiles/fonts/ ~/Library/Fonts/

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  echo "Installing Oh-my-zsh"
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

echo "Installing Powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.dotfiles/powerlevel10k

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

export PATH="/opt/homebrew/bin:$PATH"

echo "Update Homebrew recipes"
brew update

echo "Installing all our dependencies with bundle..."
brew tap homebrew/bundle
brew bundle

echo "Set default MySQL root password and auth type"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'poiu4014'; FLUSH PRIVILEGES;"

echo "Installing PHP extensions with PECL"
pecl install imagick memcached redis swoole

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

# Set macOS preferences - we will run this last because this will reload the shell
source .macos
