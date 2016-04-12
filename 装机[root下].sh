#!/bin/bash

#终端提示符彩色显示
echo 'export PS1="\[\e[32;1m\][\u@\h:\[\e[34;1m\]\w\[\e[32;1m\]]$>\[\e[0m\]"' >> ~/.bashrc
#想改哪个用户的提示符，就放到那个用户的~/.bashrc中，尽量不要动全局变量，如/etc/profile、/etc/bash.bashrc，同时~/.bashrc是最后读取的，不会被overwrite
#.vimrc同理

echo "开始安装 Vim & GVim"
apt-get install vim-gtk

echo "开始安装 ssh"
apt-get install ssh    #其实就是openssh
/etc/init.d/ssh start  #启动ssh

echo "开始安装 git"
apt-get install git
#配置ssh keys与gpg keys

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

