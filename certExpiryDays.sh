#!/usr/bin/sh

# Get the certificate expiration date
# You can use a variable to find your name, for example machine name certificate
# Example: (im sure you can do it better & more things)
# certnameinitials=$(scutil -get Computername)
# certinQuestion=$('$certnameinitials'.bst.com)
expirationDate=$(security find-certificate -c "Certificate Name" -p | openssl x509 -noout -enddate | cut -d = -f 2)

# Convert the expiration date to a timestamp
expirationTimestamp=$(date -j -f "%b %d %T %Y %Z" "$expirationDate" +%s)

# Get the current date and time
currentDate=$(date +"%b %d %T %Y %Z")

# Convert the current date and time to a timestamp
currentTimestamp=$(date -j -f "%b %d %T %Y %Z" "$currentDate" +%s)

# Calculate the number of days left until the certificate expires
daysLeft=$(( (expirationTimestamp - currentTimestamp) / 60 / 60 / 24 ))

# Output the number of days left until the certificate expires
echo "Days Left: $daysLeft"

###OUTPUT EXAMPLE###
## Days Left: 437 ##
