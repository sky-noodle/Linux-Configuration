#!/bin/bash

#终端提示符彩色显示
echo 'export PS1="\[\e[32;1m\][\u@\h:\[\e[34;1m\]\w\[\e[32;1m\]]$>\[\e[0m\]"' >> ~/.bashrc
#想改哪个用户的提示符，就放到那个用户的~/.bashrc中，尽量不要动全局变量，如/etc/profile、/etc/bash.bashrc，同时~/.bashrc是最后读取的，不会被overwrite
#.vimrc同理

#总汇
#apt-get install build-essential vim-gtk ctags cscope astyle git ssh manpages-zh
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#/etc/init.d/ssh start
#cd ~; ssh-keygen -t rsa
#cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys; ssh localhost

#echo "开始安装 build-essential" #1604以上就不需要了
#apt-get install build-essential

echo "开始安装 Vim & GVim ctags Vundle"
apt-get install vim-gtk ctags cscope astyle
#install vimdoc@cn from vimcdoc.sourceforge.net
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "开始安装 git"
apt-get install git
#配置ssh keys与gpg keys

echo "开始安装 ssh"
apt-get install ssh    #其实就是openssh(sever&client)
/etc/init.d/ssh start  #启动ssh
#cd ~; ssh-keygen -t rsa; cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys; ssh localhost

echo "开始安装 中文man"
apt-get install manpages-zh

#pycharm

#VSCode

#sublime

#Qt

#jdk  配置：在/etc/profile添加
#export JAVA_HOME=/usr/local/java/jdk1.8.0_77  *********要改哦
#export JRE_HOME=${JAVA_HOME}/jre
#export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
#export PATH=$PATH:${HOME}/bin:${JAVA_HOME}/bin

#Hadoop&Hbase

##################################
#小工具

#zsh?

#配置输入法

echo "开始安装 htop"
apt-get install htop

echo "开始安装 tree"
apt-get install tree

#echo "开始安装 在终端打开"
#sudo apt-get install nautilus-open-terminal
