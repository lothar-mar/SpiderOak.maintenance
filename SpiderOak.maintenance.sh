#!/bin/bash

#	Automated SpiderOak maintenance tasks
#
#	Author: Lothar M <lothar_@riseup.net>
#	Updates https://github.com/lothar-mar/SpiderOak.maintenance.git

#####	START OF CONFIGURATION	#####


#####	END OF CONFIGURATION	#####

clear
echo -ne "Preparing to do SpiderOak maintenance procedures. Please stand-by."
echo

#	Checking SpiderOak down status
while true; do
    echo "Please check if you have properly shutdown SpiderOak before continuing running this script. Failure to do so, may result in corruption of database."
    echo -ne "Should I proceed? (y/n)"
    read answer1
    case $answer1 in
        [Yy]* ) break;;
        [Nn]* ) echo; echo "Stopping now."; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo
echo -ne "Getting rid of all historical versions cached in SpiderOak Servers"
echo
SpiderOak --purge-historical-versions all
echo -ne "Done."
echo
echo -ne "Taking out the trash"
echo
SpiderOak --empty-garbage-bin
echo -ne "Done."
echo
echo -ne "Cleaning database (ie. rebuilding indexes)"
SpiderOak --vacuum
echo -ne "Done."
echo
echo -ne "Job complete. Have a nice day."
exit 0
