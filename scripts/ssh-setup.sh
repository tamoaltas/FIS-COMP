#!/bin/bash

# SSH key output filename
DIR=~/.ssh/id_ed25519

# Function to clean up and exit
cleanup() {
    echo $'Cleaning up...'
    # Stop the SSH agent and ignore stdout and stderr
    eval `ssh-agent -k` > /dev/null 2>&1
    # Delete the SSH key
    rm -f $DIR ${DIR}.pub
    echo $'SSH agent stopped and key deleted.'
    exit
}

# Trap Ctrl+C to ensure cleanup
trap cleanup SIGINT
# Same but for EXIT
trap cleanup EXIT

echo $'--- Step 1: Generating SSH key ---'
read -p $'Enter your email address for the SSH key: ' email
ssh-keygen -t ed25519 -C "$email" -f $DIR

# Check if key generation was successful
if [ $? -ne 0 ]; then
    echo $'--- SSH key generation failed. Exiting. ---'
    exit 1
fi

echo $'--- This is your public key. Add it your to application ---\n'
cat ${DIR}.pub
echo $'\n--- Press ENTER to continue ---'
read

echo $'--- Step 2: Starting SSH agent ---'
eval `ssh-agent -s`

echo $'\n--- Step 3: Adding the SSH key to the agent ---'
ssh-add ~/.ssh/id_ed25519

# Check if key was added successfully
if [ $? -ne 0 ]; then
    echo $'Failed to add SSH key to the agent. Exiting.'
    cleanup
fi

echo $'Done!'
echo $'\n--- Press ENTER twice to end the script and delete the keys ---'
read
read