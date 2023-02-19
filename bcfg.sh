#!/bin/bash
let "VER = $(date +%H) + 12 + $(date +%S)"
gitVER1="batus14"

intde="/usr/bin/runui"
intbat="/usr/bin/batus"
intkbat="/usr/bin/kbatus"

dede="ncal dialog wget bash w3m w3m-img mc mpv aplay grep sudo"
bade="dialog adb android-libadb fastboot grep sudo"
kbade="kdialog dialog ncal adb fastboot grep sudo"

BIRed='\033[1;91m'
BIBlue='\033[1;94m'
BIGreen='\033[1;92m'
BYellow='\033[1;33m'
No_color='\033[0m'

function exitscr(){
 if [ "$1" != "--debug" ]; then clear; fi
 echo "bConf - 2023. Russanandres"
 date
 exit
}


function startbconf(){
if [ "$1" != "--debug" ]; then clear; fi
parts=4
echo
echo "   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐"
echo "   │ Configurator                                                                         [part 1 of $parts] │"
echo "   └────────────────────────────────────────────────────────────────────────────────────────────────────┘"
echo
echo
echo "      Welcome to the bConfigurator."
echo
echo "      We will ask you questions to set up all programs"
echo "      Application changes will be after all questions."
echo
echo "       - Press ENTER to continue."
echo "       - Press CTRL + C to exit."
echo
pause
if [ "$1" != "--debug" ]; then clear; fi
echo
echo "   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐"
echo "   │ Configurator                                                                         [part 2 of $parts] │"
echo "   └────────────────────────────────────────────────────────────────────────────────────────────────────┘"
echo
echo
echo "        Install Batus or YDE?"
echo
echo "         - Type [B] to Batus"
echo "         - Type [Y] to YDE."
echo
read -sn1 two
if [ "$two" == "Y" ] || [ "$two" == "y" ]; then yde; else confbat; fi
}
function yde(){
if [ "$1" != "--debug" ]; then clear; fi
echo
echo "   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐"
echo "   │ Configurator                                                                         [part 3 of $parts] │"
echo "   └────────────────────────────────────────────────────────────────────────────────────────────────────┘"
echo
echo
echo "        What version of YDE?"
echo
echo "         - Type [R] to install release version."
echo "         - Type [D] to install debug dev version."
echo
read -sn1 yde
confpath;}
function confbat(){
if [ "$1" != "--debug" ]; then clear; fi
echo
echo "   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐"
echo "   │ Configurator                                                                         [part 3 of $parts] │"
echo "   └────────────────────────────────────────────────────────────────────────────────────────────────────┘"
echo
echo
echo "        What Batus?"
echo
echo "         - Type [K] to Kdialog Batus."
echo "         - Type [G] to Dialog Batus."
echo "         - Type [T] to Text Batus."
# echo "         - Type [] to Graphical Dialog menu."
# echo "         - Type [] to Text menu."
echo
read -sn1 batusver
confpath;}
function confpath(){
if [ "$1" != "--debug" ]; then clear; fi
echo
echo "   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐"
echo "   │ Configurator                                                                         [part 4 of $parts] │"
echo "   └────────────────────────────────────────────────────────────────────────────────────────────────────┘"
echo
echo
echo "        Select install path"
echo "        Warning! To install in /home/$USER/.local/bin/ you need enable this path!"
echo "        If you don't know how to enable it, install in /usr/bin!"
echo
echo "         - Type [B] to /usr/bin/"
echo "         - Type [L] to /home/$USER/.local/bin/"
# echo "         - Type [Y] to Your custom path."
echo
read -sn1 ipath
nowwewanttoinstallalldamnthingsthatuserchooseinhissystemandwegonnabreakalltherelolgoodbyesystemxd;}



function nowwewanttoinstallalldamnthingsthatuserchooseinhissystemandwegonnabreakalltherelolgoodbyesystemxd(){
case "$ipath" in
"B"|"b" ) path="/usr/bin/$inst";;
"L"|"l" ) path="/home/$USER/.local/bin/$inst";;
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
   sudo cp -v ./de.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "All done! To run YDE write $inst"
   exit
}

function iD(){
wget https://raw.githubusercontent.com/Russanandres/YDE/main/dev.sh
   sudo cp -v ./dev.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "All done! To run YDE dev write $inst"
   exit
}

function iK(){
sudo apt install kdialog
 wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/KBatus.sh
   sudo cp -v ./KBatus.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "All done! To run Batus write $inst"
   exit
}


function iG(){
wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/BatusLin.sh
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
echo -e "${BYellow}bConf ver$VER by Russanandres. Now is $(date)${No_color}"
echo
echo
echo -e "${BIGreen}[c]${No_color} - ${BIBlue}Let me choose all for me.${No_color}"
echo -e "${BIGreen}[any button]${No_color} - ${BIRed}I NOTHING UNDERSTAND JUST INSTALL IT!!!${No_color}"
echo
read -sn1 ch
case "$ch" in
"c" ) startbconf;;
*   )



if [ -f /usr/bin/kbatus ]; then sudo rm /usr/bin/kbatus; fi
if [ -f /usr/bin/runui ]; then sudo rm /usr/bin/runui; fi
if [ -f /usr/bin/batus ]; then sudo rm /usr/bin/batus; fi
if [ -f /usr/bin/bfl ]; then sudo rm /usr/bin/bfl; fi

if [ -f $USER/.local/bin/kbatus ]; then rm $USER/.local/bin/kbatus; fi
if [ -f $USER/.local/bin/batus ]; then rm $USER/.local/bin/batus; fi
if [ -f $USER/.local/bin/bfl ]; then rm $USER/.local/bin/bfl; fi



if [ "$XDG_SESSION_TYPE" == "wayland" ] || [ "$XDG_SESSION_TYPE" == "x11" ]; then
kdialog >> /dev/null
if [ "$?" != "0" ]; then
 cibwkd=1
 sudo apt install kdialog
  if [ "$?" != "0" ]; then
   cibwkd=0
  fi
  if [ "$cibwkd" == "1" ]; then
  wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/$gitVER.sh
  echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "1" ]; then
   cp -v ./$gitVER.sh $USER/.local/bin/kbatus
   chmod -v +x $USER/.local/bin/kbatus
   if [ "$1" != "--debug" ]; then clear; fi
   echo "All done! To run Batus write kbatus"
   exit
  fi
  echo
  echo
  echo "To continue please enter admin password:"
  sudo cp -v ./$gitVER.sh /usr/bin/kbatus
  sudo chmod -v +x /usr/bin/kbatus
  if [ "$1" != "--debug" ]; then clear; fi
  echo "All done! To run Batus write kbatus"
  exit
  fi
fi
fi

bash --version >> /dev/null
if [ "$?" != "0" ]; then
 cib=1
 sudo apt install bash
  if [ "$?" != "0" ]; then
   cib=0
  fi
  if [ "$cib" == "1" ]; then
  wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/$gitVER1.sh
  echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "1" ]; then
   cp -v ./$gitVER1.sh $USER/.local/bin/batus
   chmod -v +x $USER/.local/bin/batus
   if [ "$1" != "--debug" ]; then clear; fi
   echo "All done! To run Batus write batus"
   exit
  fi
  fi
  echo
  echo
  echo "To continue please enter admin password:"
  sudo cp -v ./$gitVER1.sh /usr/bin/batus
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

;;
esac


