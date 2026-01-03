#!/bin/bash

BASE_DIR="$HOME/Documents/hackthebox"

clear

cat << "EOF"
 _   _            _     _____ _          ____            
| | | | __ _  ___| | __|_   _| |__   ___ | __ )  _____  __
| |_| |/ _` |/ __| |/ /  | | | '_ \ / _ \|  _ \ / _ \ \/ /
|  _  | (_| | (__|   <   | | | | | | (_) | |_) | (_) >  < 
|_| |_|\__,_|\___|_|\_\  |_| |_| |_|\___/|____/ \___/_/\_\

        Hack The Box / CTF Workspace Generator / Made by Declan Middleton
EOF

echo
echo "1) Start / Create a new machine folder"
echo "2) Cleanup (DELETE all HackTheBox folders)"
echo "3) Exit"
echo
read -rp "Choose an option: " OPTION

case $OPTION in
  1)
    read -rp "Enter HackTheBox machine name: " MACHINE

    if [[ -z "$MACHINE" ]]; then
      echo "[-] Machine name cannot be empty."
      exit 1
    fi

    MACHINE_DIR="$BASE_DIR/$MACHINE"

    echo "[+] Creating directory structure..."

    mkdir -p "$MACHINE_DIR"/{scan,screenshots,other}

    echo "[✓] Workspace ready:"
    echo "    $MACHINE_DIR"
    ;;
    
  2)
    echo
    read -rp "⚠️  This will DELETE everything in $BASE_DIR. Are you sure? (yes/no): " CONFIRM

    if [[ "$CONFIRM" == "yes" ]]; then
      rm -rf "$BASE_DIR"
      echo "[✓] Cleanup completed."
    else
      echo "[*] Cleanup canceled."
    fi
    ;;
    
  3)
    echo "Good luck hacking 👾"
    exit 0
    ;;
    
  *)
    echo "[-] Invalid option."
    exit 1
    ;;
esac
