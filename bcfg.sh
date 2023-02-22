#!/bin/bash
trap "exitscr" SIGINT

intde="/usr/bin/runui"
intbat="/usr/bin/batus"
intkbat="/usr/bin/kbatus"

dede="ncal dialog wget bash w3m w3m-img mc mpv aplay grep sudo"
bade="dialog adb android-libadb fastboot grep sudo"
kbade="kdialog dialog ncal adb fastboot grep sudo"

Green='\033[0;32m'
ICyan='\033[0;96m'
BIRed='\033[1;91m'
BIBlue='\033[1;94m'
BIGreen='\033[1;92m'
BYellow='\033[1;33m'
No_color='\033[0m'

function pause(){ read -sn1 pause; }
function exitscr(){
 if [ "$1" != "--debug" ]; then clear; fi
 echo -e "batusConfigurator from 2023. By ${BIBlue}Russanandres${No_color}"
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




function selINconfERROR(){
clear
echo -e "${BIRed}
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │ Configurator error!                                                                 [Setup error!] │
    └────────────────────────────────────────────────────────────────────────────────────────────────────┘${No_color}


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
if [ "$1" != "--debug" ]; then clear; fi
parts=4
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                                        [part 1 of $parts] │
   └────────────────────────────────────────────────────────────────────────────────────────────────────┘${No_color}


${ICyan}      Welcome to the bConfigurator!${No_color}

      We will ask you $parts questions to set up all things.
      All changes will be made ${BIRed}after${No_color} all questions.

${BIBlue}       - Press ENTER to continue.
       - Press CTRL + C to exit."${No_color}
echo
pause
if [ "$1" != "--debug" ]; then clear; fi
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                                        [part 2 of $parts] │
   └────────────────────────────────────────────────────────────────────────────────────────────────────┘${No_color}


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
if [ "$1" != "--debug" ]; then clear; fi
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                                        [part 3 of $parts] │
   └────────────────────────────────────────────────────────────────────────────────────────────────────┘${No_color}


        What version of YDE?

${BIBlue}         - Type [R] to install release version.
         - Type [D] to install debug dev version."${No_color}
echo
read -sn1 yde
if [ "$yde" == "R" ] || [ "$yde" == "r" ] || [ "$yde" == "D" ] || [ "$yde" == "d" ]; then confpath;else selINconfERROR; fi;}
function confbat(){
scr="confbat"
if [ "$1" != "--debug" ]; then clear; fi
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                                        [part 3 of $parts] │
   └────────────────────────────────────────────────────────────────────────────────────────────────────┘${No_color}


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
if [ "$1" != "--debug" ]; then clear; fi
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                                        [part 4 of $parts] │
   └────────────────────────────────────────────────────────────────────────────────────────────────────┘${No_color}


        Select install path:
        ${BIRed}Warning! To install in /home/$USER/.local/bin/ you need enable this path!
        If you don't know how to enable it, select /usr/bin!${No_color}

${BIBlue}         - Type [B] to /usr/bin/
         - Type [L] to /home/$USER/.local/bin/${No_color}
"
#         - Type [Y] to Your custom path.
echo
read -sn1 ipath
if [ "$ipath" == "B" ] || [ "$ipath" == "b" ] || [ "$ipath" == "L" ] || [ "$ipath" == "l" ]; then nowwewanttoinstallalldamnthingsthatuserchooseinhissystemandwegonnabreakalltherelolgoodbyesystemxd;else selINconfERROR; fi;}


function nowwewanttoinstallalldamnthingsthatuserchooseinhissystemandwegonnabreakalltherelolgoodbyesystemxd(){
case "$ipath" in
"B"|"b" ) path="/usr/bin$inst";;
"L"|"l" ) path="/home/$USER/.local/bin$inst";;
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
   if [ "$1" != "--debug" ]; then clear; fi
   echo "All done! To run YDE write $inst"
   exit
}

function iD(){
wget https://raw.githubusercontent.com/Russanandres/YDE/main/dev.sh
   sudo apt install $dede -y
   sudo cp -v ./dev.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "All done! To run YDE dev write $inst"
   exit
}

function iK(){
sudo apt install kdialog
 wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/KBatus.sh
   sudo apt install $kbade -y
   sudo cp -v ./KBatus.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "All done! To run Batus write $inst"
   exit
}


function iG(){
wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/BatusLin.sh
   sudo apt install $bade -y
   sudo cp -v ./BatusLin.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "All done! To run Batus write $inst"
   exit
}

function iT(){
wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/For%20Legacy%20Systems/BFL.sh
   sudo cp -v ./BFL.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "All done! To run BFL write $inst"
   exit
}



if [ "$1" != "--debug" ]; then clear; fi
# echo -e "${BYellow}bConf by Russanandres. Now is $(date)${No_color}"
# echo
# echo
echo -e "${BIGreen}[c]${No_color} - ${BIBlue}Let me setup everything.${No_color}"
echo -e "${BIGreen}[any button]${No_color} - ${BIRed}I NOTHING UNDERSTAND JUST INSTALL IT!!!${No_color}"
echo
read -sn1 ch
case "$ch" in
"c" ) startbconf;;
"=" ) ijusttryingtodoagoodinterface;;
*   )


if [ -f /usr/bin/kbatus ]; then sudo rm /usr/bin/kbatus; fi
if [ -f /usr/bin/runui ]; then sudo rm /usr/bin/runui; fi
if [ -f /usr/bin/batus ]; then sudo rm /usr/bin/batus; fi
if [ -f /usr/bin/bfl ]; then sudo rm /usr/bin/bfl; fi

if [ -f $USER/.local/bin/kbatus ]; then rm $USER/.local/bin/kbatus; fi
if [ -f $USER/.local/bin/batus ]; then rm $USER/.local/bin/batus; fi
if [ -f $USER/.local/bin/bfl ]; then rm $USER/.local/bin/bfl; fi

# if [ -f $USER/.config/YDE/settings.conf ]; then source $USER/.config/YDE/settings.conf; sudo rm $int; fi


if [ "$XDG_SESSION_TYPE" == "wayland" ] || [ "$XDG_SESSION_TYPE" == "x11" ]; then
kdialog >> /dev/null
if [ "$?" != "0" ]; then
 working=1
 sudo apt install kdialog
  if [ "$?" != "0" ]; then
   working=0
  fi
  if [ "$working" == "1" ]; then
  wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/KBatus.sh
  echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "1" ]; then
   cp -v ./KBatus.sh.sh $USER/.local/bin/kbatus
   chmod -v +x $USER/.local/bin/kbatus
   if [ "$1" != "--debug" ]; then clear; fi
   echo "All done! To run Batus write kbatus"
   exit
  fi
  echo
  echo
  echo "To continue please enter admin password:"
  sudo cp -v ./Batus.sh.sh /usr/bin/kbatus
  sudo chmod -v +x /usr/bin/kbatus
  if [ "$1" != "--debug" ]; then clear; fi
  echo "All done! To run Batus write kbatus"
  exit
  fi
fi
fi

bash --version >> /dev/null
if [ "$?" != "0" ]; then
 working=1
 sudo apt install bash
  if [ "$?" != "0" ]; then
   working=0
  fi
  if [ "$working" == "1" ]; then
  wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/Batus.sh
  echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "1" ]; then
   cp -v ./Batus.sh.sh $USER/.local/bin/batus
   chmod -v +x $USER/.local/bin/batus
   if [ "$1" != "--debug" ]; then clear; fi
   echo "All done! To run Batus write batus"
   exit
  fi
  fi
  echo
  echo
  echo "To continue please enter admin password:"
  sudo cp -v ./Batus.sh.sh /usr/bin/batus
  sudo chmod -v +x /usr/bin/batus
  if [ "$1" != "--debug" ]; then clear; fi
  echo "All done! To run Batus write batus"
  exit
fi

wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/For%20Legacy%20Systems/BFL.sh
echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "1" ]; then
   cp -v ./BFL.sh $USER/.local/bin/bfl
   chmod -v +x $USER/.local/bin/bfl
   if [ "$1" != "--debug" ]; then clear; fi
   echo "All done! To run Batus write bfl"
   exit
  fi
  echo
  echo
  echo "To continue please enter admin password:"
  sudo cp -v ./BFL.sh /usr/bin/bfl
  sudo chmod -v +x /usr/bin/bfl
  if [ "$1" != "--debug" ]; then clear; fi
  echo "All done! To run Batus write bfl"
  exit


### I know that it part of code can't be run.
wget https://raw.githubusercontent.com/Russanandres/YDE/main/YDE_fallback.sh
echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "1" ]; then
   cp -v ./YDE_fallback.sh $USER/.local/bin/safeui
   chmod -v +x $USER/.local/bin/safeui
   if [ "$1" != "--debug" ]; then clear; fi
   echo "All done! To run Batus write safeui"
   exit
  fi
  echo
  echo
  echo "To continue please enter admin password:"
  sudo cp -v ./YDE_fallback.sh /usr/bin/safeui
  sudo chmod -v +x /usr/bin/safeui
  if [ "$1" != "--debug" ]; then clear; fi
  echo "All done! To run Batus write safeui"
  exit
;;
esac
echo "What if anywhere exist stairway to heavy code?"
