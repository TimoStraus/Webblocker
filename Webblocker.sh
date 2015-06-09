#!/bin/bash         

#The following line uses Zenity to show a dialog:
time=$(zenity --entry --text "How many minutes do you want to be offline?")
#time=$(kdialog --title "Offline Time" --inputbox "How many minutes do you want to be offline?" "60")


time=`expr $time \* 60`

#disconnecting the internet with nmcli:
nmcli nm enable false

while [ $time -gt 0 ]
	do
		sleep 10;  time=`expr $time - 10`
	done
	
sleep 5; 	
nmcli nm enable true
sleep 5;
zenity --info --text="You can now connect to the internet again!"
#kdialog --msgbox "You can now browse again!"

exit

