#!/bin/bash

#sudo apt-get install xclip
#sudo easy_install -ZU autopep8 
cd ~
sudo apt-get install vim-gtk ctags cscope astyle git subversion

# backup
rm -rf ~/vim_ljc ~/.vim_old
mv -f ~/.vim ~/.vim_old
mv -f ~/.vimrc ~/.vimrc_old

# new files
svn checkout https://github.com/Will-Grindelwald/Linux-Configuration/trunk/Vim ~/vim_ljc
mv -f ~/vim_ljc ~/.vim
vim -c "helptags ~/.vim/doc" -c quit
mv -f ~/.vim/.vimrc ~/.vimrc
rm -rf ~/.vim/.svn ~/.vim/README.md ~/.vim/setup.sh

# Plugin
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
vim +PluginInstall +qall

