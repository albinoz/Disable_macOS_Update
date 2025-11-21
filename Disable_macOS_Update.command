#!/bin/bash
clear
#adam - 2025/11/21

# Variables
LANG=$(defaults read -g AppleLocale | cut -d'_' -f1)
Uptime=$(system_profiler SPSoftwareDataType | grep "Time since boot:" | cut -d ':' -f2 | cut -d ' ' -f2-9)
SytemVersion=$(system_profiler SPSoftwareDataType | grep "System Version:" | cut -d ':' -f2 | cut -d ' ' -f2-9)
OSXMajor=$(sw_vers -productVersion | cut -d'.' -f1)

# About
echo
tput bold ; echo "adam" ; tput sgr0
tput bold ; echo "Disable_macOS_Update" ; tput sgr0

# Infos
echo; echo "Date:" "$(date +"%Y/%m/%d %T")"
echo "User:" "$(hostname -s)" - "$(whoami)" - "$LANG"

echo "Uptime:" "$Uptime"
echo "Hardware:" "$(system_profiler SPHardwareDataType | grep "Model Identifier" | cut -d ':' -f2 | tr -d ' ') | $SytemVersion\
 |$(system_profiler SPHardwareDataType | grep Memory | cut -d ':' -f2)\
 |$(system_profiler SPHardwareDataType | grep "Number of Processors" | cut -d ':' -f2)x\
$(system_profiler SPHardwareDataType | grep Cores | cut -d ':' -f2 | tr -d ' ') \
$(system_profiler SPHardwareDataType | grep Speed | cut -d ':' -f2 | tr -d ' ')"

# Minimum macOS
if [ "$OSXMajor" -ge 11 ] ; then echo "$SytemVersion" Supported ; else echo "$SytemVersion" not Supported && exit ; fi
echo

# Script
while true; do
  tput bold ; echo -e "Enable or Disable macOS Update [On/Off] ?" ; tput sgr0
  read -r REP
  case "$REP" in
    On|on|Off|off) break ;;
    *) echo "Invalid input. Please enter On or Off." ;;
  esac
done
echo

tput bold ; echo Enter "$(whoami)" password ; tput sgr0
while true; do
  if sudo echo ; then
     break
  fi
done

echo
case $REP in
          On|on)
               
               tput bold ; echo "🛑 Quit System Settings"; tput sgr0
               killall "System Settings"
               echo

               tput bold ; echo "☀️ " Unlock macOS Updates ; tput sgr0
               for line in \
                    "## Lock macOS Updates Start" \
                    "0.0.0.0   appldnld.apple.com" \
                    "0.0.0.0   gg.apple.com" \
                    "0.0.0.0   gnf-mdn.apple.com" \
                    "0.0.0.0   gnf-mr.apple.com" \
                    "0.0.0.0   gs.apple.com" \
                    "0.0.0.0   ig.apple.com" \
                    "0.0.0.0   mesu.apple.com" \
                    "0.0.0.0   ns.itunes.apple.com" \
                    "0.0.0.0   oscdn.apple.com" \
                    "0.0.0.0   osrecovery.apple.com" \
                    "0.0.0.0   skl.apple.com" \
                    "0.0.0.0   swcdn.apple.com" \
                    "0.0.0.0   swdist.apple.com" \
                    "0.0.0.0   swdownload.apple.com" \
                    "0.0.0.0   swpost.apple.com" \
                    "0.0.0.0   swquery.apple.com" \
                    "0.0.0.0   swscan.apple.com" \
                    "0.0.0.0   updates-http.cdn-apple.com" \
                    "0.0.0.0   updates.cdn-apple.com" \
                    "0.0.0.0   xp.apple.com" \
                    "0.0.0.0   gdmf.apple.com" \
                    "0.0.0.0   swupdl.apple.com" \
                    "::1   appldnld.apple.com" \
                    "::1   gg.apple.com" \
                    "::1   gnf-mdn.apple.com" \
                    "::1   gnf-mr.apple.com" \
                    "::1   gs.apple.com" \
                    "::1   ig.apple.com" \
                    "::1   mesu.apple.com" \
                    "::1   ns.itunes.apple.com" \
                    "::1   oscdn.apple.com" \
                    "::1   osrecovery.apple.com" \
                    "::1   skl.apple.com" \
                    "::1   swcdn.apple.com" \
                    "::1   swdist.apple.com" \
                    "::1   swdownload.apple.com" \
                    "::1   swpost.apple.com" \
                    "::1   swquery.apple.com" \
                    "::1   swscan.apple.com" \
                    "::1   updates-http.cdn-apple.com" \
                    "::1   updates.cdn-apple.com" \
                    "::1   xp.apple.com" \
                    "::1   gdmf.apple.com" \
                    "::1   swupdl.apple.com" \
                    "## Lock macOS Updates End"
               do
               # Escape dots for sed
               pattern=$(echo "$line" | sed 's/\./\\./g')
               # Remove line matching the exact pattern
               sudo sed -i '' "/^$pattern$/d" /etc/hosts
               done

               # Flush DNS cache to apply changes 
               sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
               echo
               
               tput bold ; echo "♻️ " Search SoftwareUpdate ; tput sgr0
               softwareupdate -l
               softwareupdate -l
               

               tput bold ; echo -e "☀️" ' Enable AppStore / SoftwareUpdate' ; tput sgr0
               sudo /usr/bin/defaults write /Library/Preferences/com.apple.commerce.plist AutoUpdate -bool true
               sudo /usr/bin/defaults write com.apple.appstored LastUpdateNotification -date "2020-01-01 00:00:00 +0000"
               defaults write com.apple.SoftwareUpdate MajorOSUserNotificationDate -date "2020-01-01 00:00:00 +0000"
               defaults write com.apple.SoftwareUpdate UserNotificationDate -date "2020-01-01 00:00:00 +0000"
               defaults write com.apple.SoftwareUpdate LastFullSuccessfulDate -date "2020-01-01 00:00:00 +0000"
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist LastCollectedLoginCredentialDate -date "2020-01-01 00:00:00 +0000"
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist LastSuccessfulBackgroundMSUScanDate -date "2020-01-01 00:00:00 +0000"
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist LastFullSuccessfulDate -date "2020-01-01 00:00:00 +0000"
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist LastCatalogChangeDate -date "2020-01-01 00:00:00 +0000"
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist LastSuccessfulDate -date "2020-01-01 00:00:00 +0000"
               killall NotificationCenter
               echo

               for check in AutomaticCheckEnabled AutomaticDownload ConfigDataInstall CriticalUpdateInstall
               do
                    tput bold ; echo "☀️ " Enable "$check" ; tput sgr0
                    sudo /usr/bin/defaults write /Library/Preferences/com.apple.SoftwareUpdate "$check" -bool true
                    sudo /usr/bin/defaults read /Library/Preferences/com.apple.SoftwareUpdate "$check"
                    echo
               done
               tput bold ; echo "🌙 Disable AutomaticallyInstallMacOSUpdates" ; tput sgr0
               sudo /usr/bin/defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticallyInstallMacOSUpdates -bool false
               sudo /usr/bin/defaults read /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticallyInstallMacOSUpdates
               echo

          ;;
          Off|off)
               
               tput bold ; echo "🛑 Quit System Settings"; tput sgr0
               killall "System Settings"
               echo

               tput bold ; echo "♻️ " 'Reset Red Bubbles' ; tput sgr0
               /usr/bin/defaults write com.apple.systempreferences AttentionPrefBundleIDs 0
               /usr/bin/defaults read com.apple.systempreferences AttentionPrefBundleIDs
               /usr/bin/defaults write com.apple.appstored BadgeCount 0
               /usr/bin/defaults read com.apple.appstored BadgeCount
               echo

               tput bold ; echo "🌙 Block macOS Updates" ; tput sgr0
               for line in \
                    "## Lock macOS Updates Start" \
                    "0.0.0.0   appldnld.apple.com" \
                    "0.0.0.0   gg.apple.com" \
                    "0.0.0.0   gnf-mdn.apple.com" \
                    "0.0.0.0   gnf-mr.apple.com" \
                    "0.0.0.0   gs.apple.com" \
                    "0.0.0.0   ig.apple.com" \
                    "0.0.0.0   mesu.apple.com" \
                    "0.0.0.0   ns.itunes.apple.com" \
                    "0.0.0.0   oscdn.apple.com" \
                    "0.0.0.0   osrecovery.apple.com" \
                    "0.0.0.0   skl.apple.com" \
                    "0.0.0.0   swcdn.apple.com" \
                    "0.0.0.0   swdist.apple.com" \
                    "0.0.0.0   swdownload.apple.com" \
                    "0.0.0.0   swpost.apple.com" \
                    "0.0.0.0   swquery.apple.com" \
                    "0.0.0.0   swscan.apple.com" \
                    "0.0.0.0   updates-http.cdn-apple.com" \
                    "0.0.0.0   updates.cdn-apple.com" \
                    "0.0.0.0   xp.apple.com" \
                    "0.0.0.0   gdmf.apple.com" \
                    "0.0.0.0   swupdl.apple.com" \
                    "::1   appldnld.apple.com" \
                    "::1   gg.apple.com" \
                    "::1   gnf-mdn.apple.com" \
                    "::1   gnf-mr.apple.com" \
                    "::1   gs.apple.com" \
                    "::1   ig.apple.com" \
                    "::1   mesu.apple.com" \
                    "::1   ns.itunes.apple.com" \
                    "::1   oscdn.apple.com" \
                    "::1   osrecovery.apple.com" \
                    "::1   skl.apple.com" \
                    "::1   swcdn.apple.com" \
                    "::1   swdist.apple.com" \
                    "::1   swdownload.apple.com" \
                    "::1   swpost.apple.com" \
                    "::1   swquery.apple.com" \
                    "::1   swscan.apple.com" \
                    "::1   updates-http.cdn-apple.com" \
                    "::1   updates.cdn-apple.com" \
                    "::1   xp.apple.com" \
                    "::1   gdmf.apple.com" \
                    "::1   swupdl.apple.com" \
                    "## Lock macOS Updates End"
               do
                    sudo grep -Fxq "$line" /etc/hosts || echo "$line" | sudo tee -a /etc/hosts > /dev/null
               done
               
               # Flush DNS cache to apply changes 
               sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
               echo
               
               tput bold ; echo "♻️ " Search SoftwareUpdate ; tput sgr0
               softwareupdate -l
               softwareupdate -l
               echo

               tput bold ; echo "🌙 Disable AppStore / SoftwareUpdate" ; tput sgr0
               sudo /usr/bin/defaults write /Library/Preferences/com.apple.commerce.plist AutoUpdate -bool false
               sudo /usr/bin/defaults write com.apple.appstored LastUpdateNotification -date "3030-01-01 00:00:00 +0000"
               
               chflags nouchg ~/Library/Preferences/com.apple.SoftwareUpdate.plist
               defaults write com.apple.SoftwareUpdate AvailableUpdatesNotificationCountKey -int 0
               defaults write com.apple.SoftwareUpdate AvailableUpdatesNotificationProductKey ""
               defaults write com.apple.SoftwareUpdate MajorOSUserNotificationDate -date "3030-01-01 00:00:00 +0000"
               defaults write com.apple.SoftwareUpdate UserNotificationDate -date "3030-01-01 00:00:00 +0000"
               defaults write com.apple.SoftwareUpdate LastFullSuccessfulDate -date "3030-01-01 00:00:00 +0000"
               chflags uchg  ~/Library/Preferences/com.apple.SoftwareUpdate.plist
               defaults read com.apple.SoftwareUpdate

               sudo chflags nouchg /Library/Preferences/com.apple.SoftwareUpdate.plist
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticCheckEnabled -bool false
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticDownload -bool false
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist ConfigDataInstall -bool false
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist CriticalUpdateInstall -bool false
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticallyInstallMacOSUpdates -bool false
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticAppDownload -bool false
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallAppUpdates -bool false
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallSystemDataFiles -bool false
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallSecurityUpdates -bool false
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist LastCollectedLoginCredentialDate -date "3030-01-01 00:00:00 +0000"
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist LastSuccessfulBackgroundMSUScanDate -date "3030-01-01 00:00:00 +0000"
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist LastFullSuccessfulDate -date "3030-01-01 00:00:00 +0000"
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist LastCatalogChangeDate -date "3030-01-01 00:00:00 +0000"
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist LastSuccessfulDate -date "3030-01-01 00:00:00 +0000"
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist LastBackgroundSuccessfulDate -date "3030-01-01 00:00:00 +0000"
               #sudo defaults delete /Library/Preferences/com.apple.SoftwareUpdate.plist FirstOfferDateDictionary
               #sudo defaults delete /Library/Preferences/com.apple.SoftwareUpdate.plist DDMPersistedErrorKey
               sudo defaults delete /Library/Preferences/com.apple.SoftwareUpdate.plist RecommendedUpdates
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist FirstOfferDateDictionary ""
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist LastUpdatesAvailable -int 0
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist LastRecommendedUpdatesAvailable -int 0
               sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist LastSessionSuccessful -bool true
               #sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist SkipLocalCDN -bool true
               #sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AllowSystemRestart -bool false
               sudo chflags uchg /Library/Preferences/com.apple.SoftwareUpdate.plist
               defaults read /Library/Preferences/com.apple.SoftwareUpdate

               killall NotificationCenter
          ;;
esac
