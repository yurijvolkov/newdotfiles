if [[ $1 -eq 0 ]]; then
	xdotool search --name 'Snapchat' windowactivate
	if [[ $? -eq 0 ]]; then 
		xdotool search --name 'Snapchat' windowactivate --sync key ctrl+w sleep 1 key Return;  
	else
		(/opt/google/chrome/chrome --profile-directory=Default --app-id=abdndmcckigaeepaljhpcngbfdkbiggb &) ; 
		(sleep 5 && xdotool search --name "Snapchat" windowactivate --sync\
		       	key Escape\
		       	key Tab\
		       	sleep 1\
		       	key Tab\
		       	sleep 1\
		       	key Tab\
		       	sleep 1\
		       	type "$2"\
		     && sleep 1\
		     && xdotool key Down\
		     && sleep 1\
		     && xdotool key Return\
		     && sleep 1\
		     && xdotool keydown Shift key Tab keyup Shift\
		     && sleep 1\
		     && xdotool key Return ) ;
       	fi
elif [[ $1 -eq 1 ]]; then
	wmctrl -a Spotify
	if [[ $? -ne 0 ]]; then
		(/snap/bin/spotify &) ;  
		sleep 3;
		wmctrl -a Spotify
	fi;
	sleep 1
	xdotool key alt+shift+h sleep 0.5\
		key ctrl+k sleep 0.5
	xdotool type "$2"
	xdotool sleep 1
       	xdotool key Return sleep 0.3\
	       	key Tab sleep 0.3\
	       	key Tab sleep 0.3\
	       	key Return
elif [[ $1 -eq 2 ]]; then
	wmctrl -a Spotify && xdotool key alt+shift+b
fi
