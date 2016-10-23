#!/bin/bash

if [ "$1" == "" ]; then
	OUTPUT_FILE="C:\Users\utilisateur\Desktop\firefox_history.txt"
else
	OUTPUT_FILE="C:\Users\utilisateur\Desktop\\"$1
fi

python2 <<< $'import json\nf = open("C:/Documents and Settings/utilisateur/Application Data/Mozilla/Firefox/Profiles/299rsaq0.default/sessionstore.js", "r")\njdata = json.loads(f.read())\nf.close()\nfor win in jdata.get("windows"):\n\tfor tab in win.get("tabs"):\n\t\ti = tab.get("index") - 1\n\t\tprint tab.get("entries")[i].get("url")' > $OUTPUT_FILE

echo "Firefox previous session tabs stored in file "$OUTPUT_FILE