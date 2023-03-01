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

resize="0"; debug="0"; delete="0"
if [ "$1" == "-v" ]; then exit
elif [ "$1" == "-he" ] || [ "$1" == "--help" ]; then curl https://raw.githubusercontent.com/Russanandres/bConf/main/README.md;exit
elif [ "$1" == "-fq" ] || [ "$1" == "--force-quit" ]; then exitscr
elif [ "$1" == "-nr" ] || [ "$1" == "--no-resize" ]; then resize="1"
elif [ "$1" == "-de" ] || [ "$1" == "--debug" ]; then debug="1"
elif [ "$1" == "-dl" ] || [ "$1" == "--delete-old" ]; then delete="1"
fi


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
if [ "$two" == "Y" ] || [ "$two" == "y" ]; then yde; fi
if [ "$two" == "B" ] || [ "$two" == "b" ]; then confbat;else selINconfERROR; fi;}
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
if [ "$yde" == "R" ] || [ "$yde" == "r" ] || [ "$yde" == "D" ] || [ "$yde" == "d" ]; then confpath;else selINconfERROR; fi;}
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
if [ "$batusver" == "K" ] || [ "$batusver" == "k" ] || [ "$batusver" == "G" ] || [ "$batusver" == "g" ] || [ "$batusver" == "T" ] || [ "$batusver" == "t" ]; then confpath;else selINconfERROR; fi;}
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
if [ "$ipath" == "B" ] || [ "$ipath" == "b" ] || [ "$ipath" == "L" ] || [ "$ipath" == "l" ]|| [ "$ipath" == "J" ]|| [ "$ipath" == "j" ]; then nowwewanttoinstallalldamnthingsthatuserchooseinhissystemandwegonnabreakalltherelolgoodbyesystemxd;else selINconfERROR; fi;}

function quit(){ cls; echo "All done! To start $name run $inst"; exit; }

function nowwewanttoinstallalldamnthingsthatuserchooseinhissystemandwegonnabreakalltherelolgoodbyesystemxd(){
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
echo "My script totally Dark Side of The Code!" ### It's a easter egg lol. Its never appears at screen, so don't translate it.
