#!/bin/bash         


#achtung, das skript ist jetzt für KDE optimiert!
#die nächste zeile kann verwendet werden, wenn zenity benutzt wird:

#time=$(zenity --entry --text "How many minutes do you want to be offline?")
#time=$(kdialog --title "Offline Time" --inputbox "How many minutes do you want to be offline?" "60")
echo 'How many minutes do you want to be offline?'

read time

time=`expr $time \* 60`

nmcli dev disconnect enp1s0f0 &

counter() {
sleep 10;  time=`expr $time - 10`
}

while [ $time -gt 0 ]
	do
		counter
	done
	
sleep 5;	
nmcli dev connect enp1s0f0 &
sleep 5;
#zenity --info --text="You can now connect to the internet again!"
#kdialog --msgbox "You can now browse again!"

exit



