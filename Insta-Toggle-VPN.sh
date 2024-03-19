#!/bin/bash

# 2023 - Ninux
# GNU GPL license: https://www.gnu.org/licenses/gpl-3.0.en.html

# This script allows to temporarily toggle from one Mullvad server to another with a countdown.
# It's useful when Instagram forbids your actual VPN server.

# To connect to Instagram, you just have to run this script who gives you x secondes/minutes to enter your credentials.
# It will go through Houston (e.g.) and then switching back to Paris (e.g.) after at the end of the countdown.

# Assigning a shortcut like < Super + I > to the script is a good tip to run it and toggle server.

# There is 2 ways to specify a new server:
	# mullvad relay set location [country code, e.g. "us" for USA] [optionnal city, e.g. "hou" for Houston] [optional specific server, e.g. "us-hou-wg-002"]
	# or
	# mullvad relay set hostname [specific server, e.g. "us-hou-wg-002"]


#set the primary server (e.g.: "fr par")
svr1="fr par"

#set the temporary server (e.g.: "us hou")
svr2="us hou"

#set time in seconds before automatically coming back to the primary server ($svr1)
time=30


mullvad relay set location $svr2 && sleep 4

while [ $time -gt 0 ]
do
	notify-send -t 10000 -i /usr/share/icons/hicolor/128x128/apps/mullvad-vpn.png "Coming back to < $svr1 >" "in <b>$time</b> seconds."
	sleep 10
	time=$((time-10))
done

mullvad relay set location $svr1


exit 0