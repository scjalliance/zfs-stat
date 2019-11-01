#!/bin/bash

EZKEY="$1"

if [ -z "$EZKEY" ]; then
	echo "Requires EZKEY.  Aborting."
	exit 1
fi

while read POOL; do
	# NAME AVAIL USED USEDSNAP USEDDS USEDREFRESERV USEDCHILD
	POOLNAME="$(cut -d' ' -f1 <<< $POOL)"
	AVAIL="$(cut -d' ' -f2 <<< $POOL)"
	curl -d "stat=zfs $POOLNAME AVAIL&ezkey=$EZKEY&value=$AVAIL" https://api.stathat.com/ez &
	USED="$(cut -d' ' -f3 <<< $POOL)"
	curl -d "stat=zfs $POOLNAME USED&ezkey=$EZKEY&value=$USED" https://api.stathat.com/ez &
	USEDSNAP="$(cut -d' ' -f4 <<< $POOL)"
	curl -d "stat=zfs $POOLNAME USEDSNAP&ezkey=$EZKEY&value=$USEDSNAP" https://api.stathat.com/ez &
	USEDDS="$(cut -d' ' -f5 <<< $POOL)"
	curl -d "stat=zfs $POOLNAME USEDDS&ezkey=$EZKEY&value=$USEDDS" https://api.stathat.com/ez &
	USEDREFRESERV="$(cut -d' ' -f6 <<< $POOL)"
	curl -d "stat=zfs $POOLNAME USEDREFRESERV&ezkey=$EZKEY&value=$USEDREFRESERV" https://api.stathat.com/ez &
	USEDCHILD="$(cut -d' ' -f7 <<< $POOL)"
	curl -d "stat=zfs $POOLNAME USEDCHILD&ezkey=$EZKEY&value=$USEDCHILD" https://api.stathat.com/ez &
done < <(/sbin/zfs list -pro space /*-{tank,guest} | tail -n+2 | tr -s ' ')
