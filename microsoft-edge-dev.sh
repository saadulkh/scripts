# A shell script to install Microsoft Edge Dev
# https://www.microsoftedgeinsider.com/en-us/download/

# Prepare
sudo apt install curl -y

# Setup
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo rm microsoft.gpg

# Install
sudo apt update
sudo apt install microsoft-edge-dev -y
