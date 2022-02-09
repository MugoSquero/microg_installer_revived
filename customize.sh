if $BOOTMODE; then

pm install --dont-kill -g "$MODPATH/system/priv-app/GmsCore/GmsCore.apk"
pm install --dont-kill "$MODPATH/SigSpoofHelper.apk" 2>/dev/null
rm -f "$MODPATH/SigSpoofHelper.apk"
pm grant com.android.vending android.permission.FAKE_PACKAGE_SIGNATURE
if [ -f /data/adb/Phonesky.apk ]; then
ui_print "- Installing real Play Store"
cp /data/adb/Phonesky.apk "$MODPATH/system/priv-app/Phonesky/Phonesky.apk"
else
ui_print "- Real Play Store not found, installing Fake Store"
fi
pm install --dont-kill "$MODPATH/system/priv-app/Phonesky/Phonesky.apk"
else
ui_print "- ERROR: Installation via recovery is NOT supported."
exit 1
fi
