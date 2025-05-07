#!/bin/bash

echo "--- Currently Running Processes (Top 20 by CPU and Memory) ---"
ps auxc | head -n 1
ps auxc | sort -nrk 3 | head -n 20
echo "------------------------------------------------------------------"
ps auxc | sort -nrk 4 | head -n 20
echo "------------------------------------------------------------------"

echo "
--- Installed Applications (Standard Locations) ---"
ls /Applications/
if [ -d "$HOME/Applications" ]; then
  echo "
--- Installed Applications (User Location) ---"
  ls "$HOME/Applications/"
fi
echo "------------------------------------------------------------------"

echo "
--- Login Items (User-Specific) ---"
osascript -e 'tell application "System Events" to get the name of every login item'
echo "------------------------------------------------------------------"

echo "
--- LaunchAgents and LaunchDaemons (Common Locations - may require sudo for some) ---"
echo "User LaunchAgents: $HOME/Library/LaunchAgents/"
ls "$HOME/Library/LaunchAgents/" 2>/dev/null || echo " (None found or access denied)"
echo "
System LaunchAgents: /Library/LaunchAgents/"
ls /Library/LaunchAgents/ 2>/dev/null || echo " (None found or access denied)"
echo "
System LaunchDaemons: /Library/LaunchDaemons/"
ls /Library/LaunchDaemons/ 2>/dev/null || echo " (None found or access denied)"
echo "------------------------------------------------------------------"

echo "
Script finished. Review the output above."

