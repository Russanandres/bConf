#!/bin/bash
trap "exitscr" SIGINT

intde="/usr/bin/runui"
intbat="/usr/bin/batus"
intkbat="/usr/bin/kbatus"

YDEdep="ncal dialog wget bash w3m w3m-img mc mpv aplay grep sudo"
BATdep="dialog adb fastboot grep sudo"
KBATde="kdialog dialog ncal adb fastboot grep sudo"

Green='\033[0;32m'
ICyan='\033[0;96m'
BIRed='\033[1;91m'
BIBlue='\033[1;94m'
BIGreen='\033[1;92m'
BYellow='\033[1;33m'
No_color='\033[0m'

function pause(){ read -sn1 pause; }
function cls(){ if [ "$debug" == "0" ]; then clear; fi; }
function exitscr(){
 if [ "$debug" == "0" ]; then clear; fi
 echo -e "batusConfigurator. By ${BIBlue}Russanandres${No_color}"
 echo
 echo -e "Now is - ${BIBlue}$(date +%d/%m/%y)${No_color}. Current time - ${BIBlue}$(date +%T)${No_color}"
 exit
}



function helpscr(){
echo "bcfg. By Russanandres.
Usage: bcfg.sh [option]
Availiable options:
    -v | --version      >>  Show script version
    -f | --force-quit   >>  Force quit from script
    -r | --no-resize    >>  Do not try to resize terminal
    -h | --help         >>  Show help manual
    -e | --delete-old   >>  Delete installed apps before install"; exit
}

resize="0"; debug="0"; delete="0"
while [ "$1" != "" ]; do
    case $1 in
        -v | --version)        echo $VER; exit;;
        -q | --force-quit)     exitscr;;
        -r | --no-resize )     resize="1";;
        -d | --debug )         debug="1";;
        -h | --help )          helpscr;;
        -e | --delete-old )    delete="1";;
    esac
    shift
done



function selINconfERROR(){
cls
echo -e "${BIRed}
    ┌────────────────────────────────────────────────────────────────────────────┐
    │ Configurator error!                                         [Setup error!] │
    └────────────────────────────────────────────────────────────────────────────┘${No_color}


       Somewhere in Configurator exist ${BIRed}error!${No_color}

       Try to check ${Green}data${No_color}, what you try to enter.
       If your data 100% right, create issue on github.

${BIBlue}        - Press ENTER to continue.
        - Press CTRL + C to exit.${No_color}
"
pause; $scr;}

function startbconf(){
scr="startbconf"
cls
parts=4
if [ "$resize" == "0" ]; then printf '\033[8;26;84t'; fi ### I DONT KNOW WHY BUT IT DOESNT WORK AS IT SHOULD. BASH, WHYYYYYYYYYYYYYYYYYY. It works as now, but here is a bad code((
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                [part 1 of $parts] │
   └────────────────────────────────────────────────────────────────────────────┘${No_color}


${ICyan}      Welcome to the bConfigurator!${No_color}

      We will ask you $parts questions to set up all things.
      All changes will be made ${BIRed}after${No_color} all questions.

${BIBlue}       - Press ENTER to continue.
       - Press CTRL + C to exit."${No_color}
echo
pause
cls
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                [part 2 of $parts] │
   └────────────────────────────────────────────────────────────────────────────┘${No_color}


        Install Batus or YDE?

${BIBlue}         - Type [B] to Batus
         - Type [Y] to YDE."${No_color}
echo
read -sn1 two
case $two in
Y | y ) yde;;
B | b ) confbat;;
* ) selINconfERROR;;
esac;}
function yde(){
scr="yde"
cls
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                [part 3 of $parts] │
   └────────────────────────────────────────────────────────────────────────────┘${No_color}


        What version of YDE?

${BIBlue}         - Type [R] to install release version.
         - Type [D] to install debug dev version."${No_color}
echo
read -sn1 yde
case $yde in
R | D | r | d ) confpath;;
* ) selINconfERROR;;
esac;}
function confbat(){
scr="confbat"
cls
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                [part 3 of $parts] │
   └────────────────────────────────────────────────────────────────────────────┘${No_color}


        What Batus?

${BIBlue}         - Type [K] to Kdialog Batus.
         - Type [G] to Dialog Batus.
         - Type [T] to Text Batus.${No_color}
"
#         - Type [] to Graphical Dialog menu.
#         - Type [] to Text menu.
echo
read -sn1 batusver
case $batusver in
K | G | T | k | g | t ) confpath;;
* ) selINconfERROR;;
esac;}
function confpath(){
scr="confpath"
cls
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                [part 4 of $parts] │
   └────────────────────────────────────────────────────────────────────────────┘${No_color}


        Select install path:
        ${BIRed}Warning!
        To install in $HOME/.local/bin/ you need enable this path!
        If you don't know how to enable it, select /usr/bin!${No_color}

${BIBlue}         - Type [B] to /usr/bin/
         - Type [L] to $HOME/.local/bin/
         - Type [J] to download in current directory${No_color}
"
#         - Type [Y] to Your custom path.
echo
read -sn1 ipath
case $ipath in
B | L | J | b | l | j ) installer;;
* ) selINconfERROR;;
esac;}

function quit(){ cls; echo "All done! To start $name run $inst"; exit; }

function installer(){
case "$ipath" in
"B"|"b" ) sudo="sudo"; path="/usr/bin$inst";;
"L"|"l" ) sudo=""; path="$HOME/.local/bin$inst";;
"J"|"j" ) path="$(pwd)";;
esac

case "$yde" in
"R"|"r" ) name="YDE"; inst="runui";iR;;
"D"|"d" ) name="YDE dev"; inst="runuidev";iD;;
esac

case "$batusver" in
"K"|"k" ) name="KBatus"; inst="kbatus";iK;;
"G"|"g" ) name="Batus"; inst="batus";iG;;
"T"|"t" ) name="BFL"; inst="bfl";iT;;
esac
}

function iR(){
 wget https://raw.githubusercontent.com/Russanandres/YDE/main/de.sh
 sudo apt install $YDEdep -y
 $sudo mv -v de.sh $path/$inst
 $sudo chmod -v +x $path/$inst
 quit
}

function iD(){
 wget https://raw.githubusercontent.com/Russanandres/YDE/main/dev.sh
 sudo apt install $YDEdep -y
 $sudo mv -v dev.sh $path/$inst
 $sudo chmod -v +x $path/$inst
 quit
}

function iK(){
 wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/KBatus.sh
 sudo apt install $KBATde -y
 $sudo mv -v KBatus.sh $path/$inst
 $sudo chmod -v +x $path/$inst
 quit
}

function iG(){
 wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/BatusLin.sh
 sudo apt install $BATdep -y
 $sudo mv -v BatusLin.sh $path/$inst
 $sudo chmod -v +x $path/$inst
 qiut
}

function iT(){
 wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/For%20Legacy%20Systems/BFL.sh
 $sudo mv -v BFL.sh $path/$inst
 $sudo chmod -v +x $path/$inst
 quit
}



cls
echo
echo -e "${BIGreen}[Any button]${No_color} - ${BIRed}I NOTHING UNDERSTAND JUST INSTALL IT!!!${No_color}"
echo -e "${BIGreen}[c]${No_color} - ${BIBlue}Let me setup everything.${No_color}"
echo
read -sn1 ch
case "$ch" in
"c" ) startbconf;;
*   )

if [ "$delete" == "0" ]; then
 if [ -f /usr/bin/kbatus ]; then sudo rm /usr/bin/kbatus; fi
 if [ -f /usr/bin/runui ]; then sudo rm /usr/bin/runui; fi
 if [ -f /usr/bin/batus ]; then sudo rm /usr/bin/batus; fi
 if [ -f /usr/bin/bfl ]; then sudo rm /usr/bin/bfl; fi

 if [ -f $HOME/.local/bin/kbatus ]; then rm $HOME/.local/bin/kbatus; fi
 if [ -f $HOME/.local/bin/batus ]; then rm $HOME/.local/bin/batus; fi
 if [ -f $HOME/.local/bin/bfl ]; then rm $HOME/.local/bin/bfl; fi
fi

# if [ -f $HOME/.config/YDE/settings.conf ]; then source $HOME/.config/YDE/settings.conf; sudo rm $int; fi

echo $PATH | grep "$HOME/.local/bin"
if [ "$?" == "0" ]; then
 sudo=""; path="$HOME/.local/bin"
else
 sudo="sudo"; path="/usr/bin"
fi


if [ "$XDG_SESSION_TYPE" == "wayland" ] || [ "$XDG_SESSION_TYPE" == "x11" ]; then
 sudo apt install kdialog
 kdialog --version
 if [ "$?" == "0" ]; then
  wget --tries=0 https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/KBatus.sh
  $sudo mv -v KBatus.sh $path/kbatus
  $sudo chmod -v +x $path/kbatus
  sudo apt install $KBATde
  cls;echo;echo;echo "All done! To run Batus write kbatus";exit
 fi
fi

sudo apt install bash
bash --version >> /dev/null
if [ "$?" == "0" ]; then
 wget --tries=0 https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/Batus.sh
 $sudo mv -v Batus.sh $path/batus
 $sudo chmod -v +x $path/batus
 sudo apt install $BATdep
 cls;echo;echo;echo "All done! To run Batus write batus";exit
fi

wget --tries=0 https://raw.githubusercontent.com/Russanandres/batus-linux/main/For%20Legacy%20Systems/BFL.sh
$sudo mv -v BFL.sh $path/bfl
$sudo chmod -v +x $path/bfl
cls;echo;echo;echo "All done! To run Batus write bfl";exit
;; esac
