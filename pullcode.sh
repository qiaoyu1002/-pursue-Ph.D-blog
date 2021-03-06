#!/usr/bin/env bash
#!/bin/bash

#what: to get repository from github
#how: source getcode.sh branchname
#
#bash pullcode.sh

#git clone

#remote repository
echo -e "\n Plese choose remote repository address, defalut is [0]"
strr[0]="https://github.com/qiaoyu1002/paper_code_study.git"
strr[1]="https://github.com/qiaoyu1002/-pursue-Ph.D-blog.git"

#remote branch
strb[0]="DRL_study"
strb[1]="Fedme"
strb[2]="main"
strb[3]="Tools"

#git cmd
strc[0]="git clone"
strc[1]="git pull"
strc[2]="git push"

#repository show
nn=0
total=${#strr[@]}
while [ $nn -lt $total ]
do

echo "$nn: ${strr[$nn]##*,}"
let nn++

done

if [ -z $1 ];then
	read -p "please choose or input repository, if [default] is the [0]: exit is [e] or [E]:" strinput
	if [ "$strinput" == "e" ] || [ "$strinput" == "E" ];then
	echo "exit!!!"
	exit 0
    fi
	if [ -z "$strinput" ];then
	    strstory=${strr[0]}
	else
	if [ $strinput -lt $total ];then
            strstory=${strr[$strinput]}
            strstory=${strstory%%,*}
    else
            strstory=$strinput;
    fi
    fi
else
strstory=$1
fi

echo "remote repository:" "$strstory"

#branch show
echo -e "\n Plese choose remote branch, defalut is [0]"
nn=0
total=${#strb[@]}
while [ $nn -lt $total ]
do

echo "$nn: ${strb[$nn]##*,}"
let nn++

done

if [ -z $1 ];then
	read -p "please choose or input branch: , if [default] is the [0]: exit is [e] or [E]:" strinput
    if [ "strinput" == "e" ] || [ "strinput" == "E" ];then
	echo "exit!!!"
	exit 0
    fi
	if [ -z "$strinput" ];then
	    strbranch=${strb[0]}
	else
	if [ $strinput -lt $total ];then
		strbranch=${strb[$strinput]}
		strbranch=${strbranch%%,*}
	else
		strbranch=$strinput;
	fi
	fi
else
strbranch=$1
fi

if [ "$strbranch" == "e" ] || [ "$strbranch" == "E" ];then
	echo "exit!!!"
	exit 0
fi
echo "remote branch:" "$strbranch"

echo -e "\n Plese choose git cmd, no default!!!"

#git cmd show
nn=0
total=${#strc[@]}
while [ $nn -lt $total ]
do

echo "$nn: ${strc[$nn]##*,}"
let nn++

done

read -p "please choose, git cmd, exit is [e] or [E]:" strinput

if [ "$strinput" == "e" ] || [ "$strinput" == "E" ];then
echo "exit!!!"
exit 0
fi

if [ $strinput -lt $total ];then
    strcmd=${strc[$strinput]}
    strcmd=${strcmd%%,*}
else
    strcmd=$strinput;
fi


#==========for cmd============
#1. git clone
if [ "$strcmd" == "git clone" ];then
    if [ -n "$strstory" ] || [ -n "$strbranch" ];then
        echo -e "\ngit clone -b $strbranch $strstory  $strbranch"
        read -p "------------Please check, then input [y/Y][defaut] to push, other exit:" strinput
        if [ -z "$strinput" ] || [ "$strinput" == "y" ] || [ "strinput" == "Y" ];then
            git clone -b $strbranch $strstory  $strbranch
        fi
    fi
fi

#2. git pull
#git pull origin <remote branch>:<local>
if [ "$strcmd" == "git pull" ];then
    if [ -n "$strbranch" ];then
    echo -e "\ngit pull origin $strbranch:$strbranch"
    read -p "------------Please check, then input [y/Y][defaut] to push, other exit:" strinput
    if [ -z "$strinput" ] || [ "$strinput" == "y" ] || [ "strinput" == "Y" ];then
        git pull origin $strbranch:$strbranch
    fi
    fi
fi


#3. git push
#git push origin <local branch>:<remote branch>
if [ "$strcmd" == "git push" ];then
    if [ -n "$strbranch" ];then
    echo -e "\ngit push origin $strbranch:$strbranch"
    read -p "------------Please check, then input [y/Y][defaut] to push, other exit:" strinput
    if [ -z "$strinput" ] || [ "$strinput" == "y" ] || [ "strinput" == "Y" ];then
        git push origin $strbranch:$strbranch
    fi
    fi
fi






#git clone -b DRL_study https://github.com/qiaoyu1002/paper_code_study.git DRL_study
#git pull origin <???????????????>:<???????????????>
#git push origin <???????????????>:<???????????????>
#git remote -v
##get current projectname