# zfs-stat
Overly simple zfs storage stat tracking

## Install

```
# EZKEY=your_stathat_ezkey_string
# MAILTO=optional-email-for-script-complaining@example.com
# INSTALLDIR=/opt/zfs-stat
# git clone https://github.com/scjalliance/zfs-stat.git $INSTALLDIR
# cd $INSTALLDIR
# sudo ./install.sh $EZKEY $MAILTO
```

You likely need to run with `sudo` or otherwise get superuser when running `install.sh` in order to write to `/etc/cron.d/`.  The `git clone` might require `sudo` too, depending on where you're writing it.
