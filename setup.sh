#!/bin/bash

# ask for password up-front.
sudo -v

# ~/.inputrc
echo '~/.inputrc'
touch ~/.inputrc 
echo 'Manually bind -f  ~/.inputrc'
{
tee -a ~/.inputrc <<EOF
"\t": menu-complete
"\e[A": history-search-backward
"\e[B": history-search-forward
set show-all-if-ambiguous on
set completion-ignore-case on
EOF
} > /dev/null

# ~/.vimrc

echo '~/.vimrc'
touch ~/.vimrc
{
tee -a ~/.vimrc << EOF
"這個檔案的雙引號 (") 是註解
set hlsearch            "高亮度反白
set backspace=2         "可隨時用倒退鍵刪除
"set autoindent          "自動縮排
set ruler               "可顯示最後一列的狀態
set showmode            "左下角那一列的狀態
set nu                  "可以在每一列的最前面顯示行號啦！
set bg=dark             "顯示不同的底色色調
syntax on               "進行語法檢驗，顏色顯示。

"set cursorline " 啟用行游標提示。

set scrolloff=3 	 "捲動時保留底下 3 行。
set tabstop=3   	 "自訂(Tab)位元數。
set shiftwidth=3	 "自訂縮排位元數。

set expandtab   " 用 space 代替 tab

"set t_Co=256
colorscheme desertink
autocmd BufEnter *.txt set syntax=c
autocmd BufEnter *.log set syntax=c
EOF
} > /dev/null


# ~/.bashrc colorful man page
# colorful man page
echo 'Colorful man page. Manually source ~/.bashrc'
touch ~/.bashrc
{
tee -a ~/.bashrc << EOF
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[01;36m'
export LESS_TERMCAP_md=$'\E[01;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;33m'
EOF
} > /dev/null

#screenrc
wget https://gist.githubusercontent.com/joaopizani/2718397/raw/9e2560b77e1e1298ef24be16297d853f9885b20d/.screenrc
#gdbinint
wget https://raw.githubusercontent.com/cyrus-and/gdb-dashboard/master/.gdbinit

# ref 
# https://github.com/kevinhughes27/setup-script/blob/master/bootstrap.sh

# git
read -p "Install git (Y/y)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt-get install git
fi

# python
read -p "Install python3 (Y/y)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt-get install python3-pip
    pip3 install --upgrade pip
    sudo pip3 install setuptools
fi

