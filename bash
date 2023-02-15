#!/bin/bash

# Install necessary packages
sudo apt-get install -y wget

# Download the wordlist
wget https://github.com/vpofsales/testfan/blob/main/testkeyword

# Iterate through each keyword
for keyword in $(cat testkeyword); do
    # Check the page
    page=$(wget -O - https://gamma.io/collections/bns/$keyword.btc)
    if [[ $page == *"<title>Sorry, page not found"* ]]; then
        echo "$keyword.btc is available!"
    fi
done
