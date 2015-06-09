#!/bin/bash         


#achtung, das skript ist jetzt für KDE optimiert!!

#die nächste zeile kann verwendet werden, wenn zenity benutzt wird:
time=$(zenity --entry --text "How many minutes do you want to be offline?")
#time=$(kdialog --title "Offline Time" --inputbox "How many minutes do you want to be offline?" "60")


time=`expr $time \* 60`

nmcli nm enable false

counter() {
sleep 10;  time=`expr $time - 10`
}

while [ $time -gt 0 ]
	do
		counter
	done
	
sleep 5; 	
nmcli nm enable true
sleep 5;
zenity --info --text="You can now connect to the internet again!"
#kdialog --msgbox "You can now browse again!"

exit

