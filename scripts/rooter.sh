#================================
## Modem Tool
#================================
# Rooter Support untuk modem rakitan
svn co https://github.com/karnadii/rooter/trunk/package/rooter-builds/0protocols/luci-proto-3x package/luci-proto-3x
svn co https://github.com/karnadii/rooter/trunk/package/rooter-builds/0protocols/luci-proto-mbim package/luci-proto-mbim
svn co https://github.com/karnadii/rooter/trunk/package/rooter/0drivers/rmbim package/rmbim
svn co https://github.com/karnadii/rooter/trunk/package/rooter/0drivers/rqmi package/rqmi
svn co https://github.com/karnadii/rooter/trunk/package/rooter/0basicsupport/ext-sms package/ext-sms
svn co https://github.com/karnadii/rooter/trunk/package/rooter/0basicsupport/ext-buttons package/ext-buttons
svn co https://github.com/karnadii/rooter/trunk/package/rooter/ext-rooter-basic package/ext-rooter-basic
# Rooter splash
svn co https://github.com/karnadii/rooter/trunk/package/rooter/0splash/status package/status
svn co https://github.com/karnadii/rooter/trunk/package/rooter/0splash/splash package/splash
svn co https://github.com/karnadii/rooter/trunk/package/rooter/0splash/ext-splashconfig package/ext-splashconfig
svn co https://github.com/karnadii/rooter/trunk/package/rooter/0splash/ext-splash package/ext-splash
# Rooter Bandwith monitor
svn co https://github.com/karnadii/rooter/trunk/package/rooter/0optionalapps/bwallocate package/bwallocate
svn co https://github.com/karnadii/rooter/trunk/package/rooter/0optionalapps/bwmon package/bwmon
svn co https://github.com/karnadii/rooter/trunk/package/rooter/0optionalapps/ext-throttle package/ext-throttle

# disable banner from rooter
sudo chmod -x package/ext-rooter-basic/files/etc/init.d/bannerset
sed -i 's/luci-theme-openwrt-2020/luci-theme-argon/g' package/ext-rooter-basic/Makefile
# Add luci-app-3ginfo
# svn co https://github.com/lynxnexy/luci-app-3ginfo/trunk package/luci-app-3ginfo
# Add luci-app-atinout-mod
svn co https://github.com/lynxnexy/luci-app-atinout-mod/trunk package/luci-app-atinout-mod

# Set modemmanager to disable
mkdir -p feeds/luci/protocols/luci-proto-modemmanager/root/etc/uci-defaults
cat << EOF > feeds/luci/protocols/luci-proto-modemmanager/root/etc/uci-defaults/70-modemmanager
[ -f /etc/init.d/modemmanager ] && /etc/init.d/modemmanager disable
exit 0
EOF
