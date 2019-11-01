#!/bin/bash

EZKEY="$1"
MAILTO="$2"
INSTALLDIR="$(dirname "$(readlink -f "$0")")"
TMPCRON=/tmp/zfs-stat.cron.$$
CRONFILE=/etc/cron.d/zfs-stat

if [ -z "$EZKEY" ]; then
	echo "Requires EZKEY.  Aborting."
	exit 1
fi

echo -n > "$TMPCRON"
[ ! -z "$MAILTO" ] && echo "MAILTO=$MAILTO" >> "$TMPCRON"
echo "* * * * *	root	test -x $INSTALLDIR/zfs-stat.sh && $INSTALLDIR/zfs-stat.sh $EZKEY" >> "$TMPCRON"
mv "$TMPCRON" "$CRONFILE"
[ -f "$TMPCRON" ] && rm "$TMPCRON"
ls -la "$CRONFILE"
