#!/bin/bash

#终端提示符彩色显示
sudo echo 'export PS1="\[\e[32;1m\][\u@\h:\[\e[34;1m\]\w\[\e[32;1m\]]$>\[\e[0m\]"' >> ~/.bashrc
sudo echo 'export PS1="\[\e[32;1m\][\u@\h:\[\e[34;1m\]\w\[\e[32;1m\]]$>\[\e[0m\]"' >> /root/.bashrc
#想改哪个用户的提示符, 就放到那个用户的~/.bashrc中, 尽量不要动全局变量, 如/etc/profile、/etc/bash.bashrc, 同时~/.bashrc是最后读取的, 不会被overwrite
#.vimrc同理

echo "开始安装 build-essential" #1604以上就不需要了
sudo apt-get install build-essential

#VSCode                     # 作为主力 GUI 编辑器, 甚至 IDE

echo "开始安装 Vim 套装"    # 作为主力 终端界面的 编辑器, 保证适用简洁高效
sudo apt-get install vim-gtk ctags cscope astyle
#install vimdoc@cn from vimcdoc.sourceforge.net
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
wget -q https://raw.githubusercontent.com/Will-Grindelwald/Linux-Configuration/master/Vim/setup && sh -x setup

echo "开始安装 git"
sudo apt-get install git
#配置ssh keys与gpg keys

echo "开始安装 ssh"
sudo apt-get install ssh    #其实就是openssh(sever&client)
/etc/init.d/ssh start       #启动ssh
cd ~; ssh-keygen -t rsa; cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys; ssh localhost

echo "开始安装 中文man"
sudo apt-get install manpages-zh

echo "cmake"
sudo apt-get install cmake

#pycharm

#sublime

#Qt

#eclipse

#echo "maven"
#sudo apt-get install maven

#echo "protocol-buffer"
#sudo apt-get install protobuf-compiler

#Hadoop&Hbase 安装见https://github.com/Will-Grindelwald/Coursework/tree/master/BDMS_2016_spring/hw1/安装与配置, 以下是将hadoop源码转成eclipse项目导入eclipse中
#sudo apt-get install g++ maven protobuf-compiler=2.5.0 cmake zlib1g-dev findbugs
#cd hadoop的源码目录
#cd ./hadoop-maven-plugins
#mvn install
#cd ../** 你想构建的项目目录
#mvn eclipse:eclipse -DskipTests

#jdk  配置: 在 /etc/profile 及 .bashrc 添加
#export JAVA_HOME=/usr/local/java/jdk1.8.0_77  *********要改哦
#export JRE_HOME=${JAVA_HOME}/jre
#export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
#export PATH=${PATH}:${HOME}/bin:${JAVA_HOME}/bin
#sudo update-alternatives --install /usr/bin/java java ${JAVA_HOME}/bin/java 300
#sudo update-alternatives --install /usr/bin/jar jar ${JAVA_HOME}/bin/jar 300
#sudo update-alternatives --install /usr/bin/javac javac ${JAVA_HOME}/bin/javac 300
#sudo update-alternatives --install /usr/bin/javah javah ${JAVA_HOME}/bin/javah 300
#sudo update-alternatives --install /usr/bin/javap javap ${JAVA_HOME}/bin/javap 300

##################################
#小工具

#echo "zsh"
#sudo apt-get install zsh

#配置输入法

#echo "开始安装 gksu"       #使GUI程序使用sudo
#sudo apt-get install gksu

echo "开始安装 htop"
sudo apt-get install htop

echo "开始安装 tree"
sudo apt-get install tree

#echo "dconf Editor"        #系统配置编辑器
sudo apt-get install dconf-editor

#GUI软件
#BleachBit
#Chromium
#Unity Tweak Tool

#echo "开始安装 在终端打开"
#sudo apt-get install nautilus-open-terminal

#echo "点击应用程序 Launcher 图标即可最小化"
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true

#echo "Unity 启动器移动到桌面底部"
#gsettings set com.canonical.Unity.Launcher launcher-position Bottom
