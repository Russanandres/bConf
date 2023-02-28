#!/bin/bash
trap "exitscr" SIGINT

intde="/usr/bin/runui"
intbat="/usr/bin/batus"
intkbat="/usr/bin/kbatus"

YDEdep="ncal dialog wget bash w3m w3m-img mc mpv aplay grep sudo"
BATdep="dialog adb android-libadb fastboot grep sudo"
KBATde="kdialog dialog ncal adb fastboot grep sudo"

Green='\033[0;32m'
ICyan='\033[0;96m'
BIRed='\033[1;91m'
BIBlue='\033[1;94m'
BIGreen='\033[1;92m'
BYellow='\033[1;33m'
No_color='\033[0m'

function pause(){ read -sn1 pause; }
function exitscr(){
 if [ "$debug" == "0" ]; then clear; fi
 echo -e "batusConfigurator. By ${BIBlue}Russanandres${No_color}"
 echo
 echo -e "Now is - ${BIBlue}$(date +%d/%m/%y)${No_color}. Current time - ${BIBlue}$(date +%T)${No_color}"
 exit
}

function ijusttryingtodoagoodinterface(){
clear
echo
echo -e "${BIGreen}[Any button]${No_color} - ${BIRed}I NOTHING UNDERSTAND JUST INSTALL IT!!!${No_color}"
echo -e "${BIGreen}[c]${No_color} - ${BIBlue}Let me setup everything.${No_color}"
echo
read -sn1
}

resize="0"; debug="0"; delete="0"
if [ "$1" == "-v" ]; then exit
elif [ "$1" == "-he" ] || [ "$1" == "--help" ]; then curl https://raw.githubusercontent.com/Russanandres/bConf/main/README.md
elif [ "$1" == "-fq" ] || [ "$1" == "--force-quit" ]; then exitscr
elif [ "$1" == "-nr" ] || [ "$1" == "--no-resize" ]; then resize="1"
elif [ "$1" == "-de" ] || [ "$1" == "--debug" ]; then debug="1"
elif [ "$1" == "-dl" ] || [ "$1" == "--delete-old" ]; then delete="1"
fi


function selINconfERROR(){
clear
echo -e "${BIRed}
    ┌────────────────────────────────────────────────────────────────────────────┐
    │ Configurator error!                                         [Setup error!] │
    └────────────────────────────────────────────────────────────────────────────┘${No_color}


       Somewhere in Configurator exist ${BIRed}error!${No_color}

       Try to check ${Green}data${No_color}, what you try to shove.
       If your data 100% right, create issue on github.

${BIBlue}        - Press ENTER to continue.
        - Press CTRL + C to exit.${No_color}
"
pause
$scr
}

function startbconf(){
scr="startbconf"
if [ "$debug" == "0" ]; then clear; fi
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
if [ "$debug" == "0" ]; then clear; fi
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
if [ "$two" == "B" ] || [ "$two" == "b" ]; then confbat;else selINconfERROR; fi
}
function yde(){
scr="yde"
if [ "$debug" == "0" ]; then clear; fi
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
if [ "$debug" == "0" ]; then clear; fi
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
if [ "$debug" == "0" ]; then clear; fi
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                [part 4 of $parts] │
   └────────────────────────────────────────────────────────────────────────────┘${No_color}


        Select install path:
        ${BIRed}Warning!
        To install in /home/$USER/.local/bin/ you need enable this path!
        If you don't know how to enable it, select /usr/bin!${No_color}

${BIBlue}         - Type [B] to /usr/bin/
         - Type [L] to /home/$USER/.local/bin/
         - Type [J] to download in current directory${No_color}
"
#         - Type [Y] to Your custom path.
echo
read -sn1 ipath
if [ "$ipath" == "B" ] || [ "$ipath" == "b" ] || [ "$ipath" == "L" ] || [ "$ipath" == "l" ]|| [ "$ipath" == "J" ]|| [ "$ipath" == "j" ]; then nowwewanttoinstallalldamnthingsthatuserchooseinhissystemandwegonnabreakalltherelolgoodbyesystemxd;else selINconfERROR; fi;}


function nowwewanttoinstallalldamnthingsthatuserchooseinhissystemandwegonnabreakalltherelolgoodbyesystemxd(){
case "$ipath" in
"B"|"b" ) path="/usr/bin$inst";;
"L"|"l" ) path="/home/$USER/.local/bin$inst";;
"J"|"j" ) path="$(pwd)";;
esac

case "$yde" in
"R"|"r" ) inst="runui";iR;;
"D"|"d" ) inst="runuidev";iD;;
esac

case "$batusver" in
"K"|"k" ) inst="kbatus";iK;;
"G"|"g" ) inst="batus";iG;;
"T"|"t" ) inst="bfl";iT;;
esac
}

function iR(){
wget https://raw.githubusercontent.com/Russanandres/YDE/main/de.sh
   sudo apt install $dede -y
   sudo cp -v ./de.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$debug" == "0" ]; then clear; fi
   echo "All done! To start YDE run $inst"
   exit
}

function iD(){
wget https://raw.githubusercontent.com/Russanandres/YDE/main/dev.sh
   sudo apt install $dede -y
   sudo cp -v ./dev.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$debug" == "0" ]; then clear; fi
   echo "All done! To start YDE dev run $inst"
   exit
}

function iK(){
sudo apt install kdialog
 wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/KBatus.sh
   sudo apt install $kbade -y
   sudo cp -v ./KBatus.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$debug" == "0" ]; then clear; fi
   echo "All done! To start Batus run $inst"
   exit
}


function iG(){
wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/BatusLin.sh
   sudo apt install $bade -y
   sudo cp -v ./BatusLin.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$debug" == "0" ]; then clear; fi
   echo "All done! To start Batus run $inst"
   exit
}

function iT(){
wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/For%20Legacy%20Systems/BFL.sh
   sudo cp -v ./BFL.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$debug" == "0" ]; then clear; fi
   echo "All done! To start BFL run $inst"
   exit
}

if [ "$debug" == "0" ]; then clear; fi
echo
echo -e "${BIGreen}[Any button]${No_color} - ${BIRed}I NOTHING UNDERSTAND JUST INSTALL IT!!!${No_color}"
echo -e "${BIGreen}[c]${No_color} - ${BIBlue}Let me setup everything.${No_color}"
echo
read -sn1 ch
case "$ch" in
"c" ) startbconf;;
"=" ) clear; debugfeatures; exit;;
*   )

if [ "$delete" == "0" ]; then
 if [ -f /usr/bin/kbatus ]; then sudo rm /usr/bin/kbatus; fi
 if [ -f /usr/bin/runui ]; then sudo rm /usr/bin/runui; fi
 if [ -f /usr/bin/batus ]; then sudo rm /usr/bin/batus; fi
 if [ -f /usr/bin/bfl ]; then sudo rm /usr/bin/bfl; fi

 if [ -f $USER/.local/bin/kbatus ]; then rm $USER/.local/bin/kbatus; fi
 if [ -f $USER/.local/bin/batus ]; then rm $USER/.local/bin/batus; fi
 if [ -f $USER/.local/bin/bfl ]; then rm $USER/.local/bin/bfl; fi
fi

# if [ -f $USER/.config/YDE/settings.conf ]; then source $USER/.config/YDE/settings.conf; sudo rm $int; fi


if [ "$XDG_SESSION_TYPE" == "wayland" ] || [ "$XDG_SESSION_TYPE" == "x11" ]; then
kdialog
if [ "$?" == "0" ]; then
 working=1
 sudo apt install kdialog
  if [ "$?" != "0" ]; then working=0; fi
  if [ "$working" == "1" ]; then
  wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/KBatus.sh
  echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "0" ]; then
   cp -v ./KBatus.sh.sh $USER/.local/bin/kbatus
   chmod -v +x $USER/.local/bin/kbatus
  else
  echo "To continue please enter admin password:"
  sudo cp -v ./Batus.sh.sh /usr/bin/kbatus
  sudo chmod -v +x /usr/bin/kbatus
  fi
  echo;echo
  if [ "$debug" == "0" ]; then clear; fi
  echo "All done! To run Batus write kbatus"
  exit
  fi
fi
fi

bash --version >> /dev/null
if [ "$?" == "0" ]; then
 working=1
 sudo apt install bash
  if [ "$?" != "0" ]; then
   working=0
  fi
  if [ "$working" == "1" ]; then
  wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/Batus.sh
  echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "0" ]; then
   cp -v ./Batus.sh.sh $USER/.local/bin/batus
   chmod -v +x $USER/.local/bin/batus
   if [ "$debug" == "0" ]; then clear; fi
  else
  echo "To continue please enter admin password:"
  sudo cp -v ./Batus.sh.sh /usr/bin/batus
  sudo chmod -v +x /usr/bin/batus
  fi
  fi
  echo;echo
  if [ "$debug" == "0" ]; then clear; fi
  echo "All done! To run Batus write batus"
  exit
fi

wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/For%20Legacy%20Systems/BFL.sh
echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "0" ]; then
   cp -v ./BFL.sh $USER/.local/bin/bfl
   chmod -v +x $USER/.local/bin/bfl
   if [ "$debug" == "0" ]; then clear; fi
  else
  echo "To continue please enter admin password:"
  sudo cp -v ./BFL.sh /usr/bin/bfl
  sudo chmod -v +x /usr/bin/bfl
  fi
  echo;echo
  if [ "$debug" == "0" ]; then clear; fi
  echo "All done! To run Batus write bfl"
  exit
;;
esac
echo "My script totally Dark Side of The Code!" ### It's a easter egg lol. Its never appears at screen, so don't translate it.
