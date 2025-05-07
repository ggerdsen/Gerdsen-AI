#!/bin/bash

echo "--- Configuring Mac Mini for Optimal Server Performance and Remote Access ---"

# --- Power Management Settings (Requires sudo) ---
echo "
[INFO] Configuring power management settings..."

# Prevent system sleep (displaysleep, sleep, and disksleep are in minutes, 0 to disable)
# Set computer sleep to Never (0 minutes)
sudo pmset -a sleep 0
echo "[CONFIG] Computer sleep set to Never."

# Set display sleep to Never (0 minutes) - useful for servers, though less critical if truly headless
sudo pmset -a displaysleep 0
echo "[CONFIG] Display sleep set to Never."

# Disable hard disk sleep
sudo pmset -a disksleep 0
echo "[CONFIG] Hard disk sleep disabled."

# Disable hibernation (mode 0 is no hibernation, mode 3 is default for desktops)
# This can save disk space used by the sleepimage file and prevent issues with some server software.
sudo pmset -a hibernatemode 0
echo "[CONFIG] Hibernation mode set to 0 (disabled)."

# Disable Power Nap (prevents Mac from waking for network access, Time Machine, etc., during sleep - less relevant if sleep is disabled but good practice for servers)
sudo pmset -a powernap 0
echo "[CONFIG] Power Nap disabled."

# Disable standby mode (a deeper sleep state)
sudo pmset -a standby 0
echo "[CONFIG] Standby mode disabled."

# Disable TCP keep alive when sleeping (less relevant if sleep is off, but for completeness)
sudo pmset -a tcpkeepalive 0
echo "[CONFIG] TCP keep alive during sleep disabled."

# Ensure system wakes on network access (Wake On LAN/WOL)
# This is generally on by default if Ethernet is connected, but we can ensure it.
sudo pmset -a womp 1
echo "[CONFIG] Wake on network access (womp) enabled."

# Auto power on after a power failure
sudo pmset -a autorestart 1
echo "[CONFIG] Automatic restart on power failure enabled."


# --- Remote Access Settings (Requires sudo) ---
echo "
[INFO] Configuring remote access settings..."

# Enable Remote Login (SSH)
# This ensures SSH is enabled and will start on boot, allowing login even if no user is logged into the GUI.
sudo systemsetup -setremotelogin on
echo "[CONFIG] Remote Login (SSH) enabled."

# Enable Remote Apple Events
# This allows scripts or applications on other machines to send Apple Events to this Mac.
sudo systemsetup -setremoteappleevents on
echo "[CONFIG] Remote Apple Events enabled."


echo "
--- Configuration Complete ---"
echo "[IMPORTANT] It is highly recommended to REBOOT your Mac Mini for all these settings to take full effect."
echo "[INFO] After rebooting, your Mac Mini should stay awake, be optimized for performance, and allow remote SSH login and Apple Events even without a local user logged into the GUI."
echo "[INFO] Remember that specific applications like N8N and Ollama will need to be configured as system services (LaunchDaemons) to start automatically on boot and run in the background. We will address this during their installation."

