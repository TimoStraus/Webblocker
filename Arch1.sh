#!/bin/bash         

echo 'How many minutes do you want to be offline?'

time=20

nmcli dev disconnect enp1s0f0

#sh ~/Output/Programme/webblocker/webblockerArchmodul2.sh &

counter() {
sleep 10;  time=`expr $time - 10`
}

while [ $time -gt 0 ]
	do
		counter
	done
	
sleep 5;	
nmcli dev connect enp1s0f0
sleep 5;

exit

