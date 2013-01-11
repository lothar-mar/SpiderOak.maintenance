#!/bin/bash

#	Automated SpiderOak maintenance tasks
#
#	Author: Lothar M <lothar_@riseup.net>
#	Updates https://github.com/lothar-mar/SpiderOak.maintenance.git

#####	START OF CONFIGURATION	#####


#####	END OF CONFIGURATION	#####


echo
echo -ne "Getting rid of all historical versions cached in SpiderOak Servers"
SpiderOak --purge-historical-versions all
echo -ne "Done."
echo -ne "Taking out the trash"
SpiderOak --empty-garbage-bin
echo -ne "Done."
echo -ne "Cleaning database (ie. rebuilding indexes)"
SpiderOak --vacuum
echo -ne "Done."
echo -ne "Job complete. Have a nice day."
exit 0
