#!/bin/sh
# Few lines to bypass irrelevant popups

# Define loggedin user
loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`

# Add loggedin user to the elevated group
sudo dscl . append  /Groups/elevated GroupMembership $loggedInUser

# EULA bypass
sudo /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild --license accept

# Installs Xcode CLI tools and other items
sudo /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild -runFirstLaunch

# You can also launch the app as logged in user.
su $loggedInUser -c /Applications/Xcode.app
# This line isn't tested. 
It should work, but if it doesn't then launch the binary inside /Contents/MacOS/Xcode (or whatever the binary name is when you will use this script).



exit 0
