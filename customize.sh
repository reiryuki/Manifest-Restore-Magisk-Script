# space
ui_print " "

# var
UID=`id -u`
[ ! "$UID" ] && UID=0

# optionals
OPTIONALS=/data/media/"$UID"/optionals.prop
if [ ! -f $OPTIONALS ]; then
  touch $OPTIONALS
fi

# debug
if [ "`grep_prop debug.log $OPTIONALS`" == 1 ]; then
  ui_print "- The install log will contain detailed information"
  set -x
  ui_print " "
fi

# run
. $MODPATH/function.sh

# info
MODVER=`grep_prop version $MODPATH/module.prop`
MODVERCODE=`grep_prop versionCode $MODPATH/module.prop`
ui_print " ID=$MODID"
ui_print " Version=$MODVER"
ui_print " VersionCode=$MODVERCODE"
if [ "$KSU" == true ]; then
  ui_print " KSUVersion=$KSU_VER"
  ui_print " KSUVersionCode=$KSU_VER_CODE"
  ui_print " KSUKernelVersionCode=$KSU_KERNEL_VER_CODE"
else
  ui_print " MagiskVersion=$MAGISK_VER"
  ui_print " MagiskVersionCode=$MAGISK_VER_CODE"
fi
ui_print " "

# recovery
mount_partitions_in_recovery

# magisk
magisk_setup

# path
SYSTEM=`realpath $MIRROR/system`
VENDOR=`realpath $MIRROR/vendor`
SYSTEM_EXT=`realpath $MIRROR/system_ext`

# info
ui_print "- This is not a module,"
ui_print "  so this will not remain in module list."
ui_print " "

# restore
ui_print "- Restoring original ROM manifest.xml..."
remount_rw
FILES="$SYSTEM/etc/vintf/manifest.xml
       $VENDOR/etc/vintf/manifest.xml
       $SYSTEM_EXT/etc/vintf/manifest.xml
       $SYSTEM/manifest.xml
       $VENDOR/manifest.xml
       $SYSTEM_EXT/manifest.xml"
restore
rm -f /*/early-mount.d/system/etc/vintf/manifest.xml\
 /mnt/vendor/persist/early-mount.d/system/etc/vintf/manifest.xml\
 /data/unencrypted/early-mount.d/system/etc/vintf/manifest.xml
remount_ro
ui_print " "

# exit
ui_print "- Done. Now reboot your device."
rm -rf /data/adb/modules*/$MODID
exit





