#!/bin/bash
clear

echo "adam | 2025/11/13"
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
                    "## Lock macOS Updates End" 
               do
               # Escape dots for sed
               pattern=$(echo "$line" | sed 's/\./\\./g')
               # Remove line matching the exact pattern
               sudo sed -i '' "/^$pattern$/d" /etc/hosts
               done

               # Flush DNS cache to apply changes 
               sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
               echo 1 ; echo

               tput bold ; echo -e "☀️" ' Enable AppStore AutoUpdate' ; tput sgr0
               sudo /usr/bin/defaults write /Library/Preferences/com.apple.commerce.plist AutoUpdate -bool TRUE
               sudo /usr/bin/defaults read /Library/Preferences/com.apple.commerce.plist AutoUpdate
               /usr/bin/defaults write com.apple.appstored LastUpdateNotification -date "3023-12-12 12:00:00 +0000"
               /usr/bin/defaults read com.apple.appstored LastUpdateNotification
               echo

               for check in AutomaticCheckEnabled AutomaticDownload ConfigDataInstall CriticalUpdateInstall
               do
                    tput bold ; echo "☀️ " Enable "$check" ; tput sgr0
                    sudo /usr/bin/defaults write /Library/Preferences/com.apple.SoftwareUpdate "$check" -bool TRUE
                    sudo /usr/bin/defaults read /Library/Preferences/com.apple.SoftwareUpdate "$check"
                    echo
               done
               tput bold ; echo "🌙 Disable AutomaticallyInstallMacOSUpdates" ; tput sgr0
               sudo /usr/bin/defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticallyInstallMacOSUpdates -bool FALSE
               sudo /usr/bin/defaults read /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticallyInstallMacOSUpdates
               echo

          ;;
          Off|off)
               
               tput bold ; echo "🌙 Disable Network" ; tput sgr0
               active_services=$(networksetup -listallnetworkservices | grep -v '^\*' | grep -v disabled)
               while IFS= read -r service; do sudo  networksetup -setnetworkserviceenabled "$service" off; done <<< "$active_services"
               echo 0 ; echo

               tput bold ; echo "♻️ " 'Reset Red Bubbles' ; tput sgr0
               /usr/bin/defaults write com.apple.systempreferences AttentionPrefBundleIDs 0
               /usr/bin/defaults read com.apple.systempreferences AttentionPrefBundleIDs
               /usr/bin/defaults write com.apple.appstored BadgeCount 0
               /usr/bin/defaults read com.apple.appstored BadgeCount
               softwareupdate -l > /dev/null
               softwareupdate -l > /dev/null
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
                    "## Lock macOS Updates End"
               do
                    sudo grep -Fxq "$line" /etc/hosts || echo "$line" | sudo tee -a /etc/hosts > /dev/null
               done
               # Flush DNS cache to apply changes 
               sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
               echo 0 ; echo


               tput bold ; echo "🌙 Disable AppStore AutoUpdate" ; tput sgr0
               sudo /usr/bin/defaults write /Library/Preferences/com.apple.commerce.plist AutoUpdate -bool FALSE
               sudo /usr/bin/defaults read /Library/Preferences/com.apple.commerce.plist AutoUpdate
               /usr/bin/defaults write com.apple.appstored LastUpdateNotification -date "3030-12-12 12:00:00 +0000"
               /usr/bin/defaults read com.apple.appstored LastUpdateNotification
               echo

               for check in AutomaticCheckEnabled AutomaticDownload ConfigDataInstall CriticalUpdateInstall AutomaticallyInstallMacOSUpdates
               do
                    tput bold ; echo "🌙 Disable" "$check" ; tput sgr0
                    sudo /usr/bin/defaults write /Library/Preferences/com.apple.SoftwareUpdate "$check" -bool FALSE
                    sudo /usr/bin/defaults read /Library/Preferences/com.apple.SoftwareUpdate "$check"
                    echo
               done

               tput bold ; echo "☀️ " Enable Network ; tput sgr0
               while IFS= read -r service; do sudo  networksetup -setnetworkserviceenabled "$service" on; done <<< "$active_services"
               echo 1 ; echo
          ;;
esac
