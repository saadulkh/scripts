# A shell script to setup Ubuntu after a fresh install.
# Created by Saad Khan on April 01, 2021.

# Configure Settings
gsettings set org.gnome.desktop.interface enable-hot-corners true
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'suspend'

# Debloate System
sudo apt purge gnome-characters gnome-font-viewer gnome-logs rhythmbox seahorse totem ubuntu-desktop yelp -y
sudo apt auto-remove -y

# Enable Partner Repositories
sudo sed -i.bak "/^# deb .*partner/ s/^# //" /etc/apt/sources.list

# Update and Upgrade System
sudo apt update && sudo apt upgrade -y

# Install MS Edge Browser
wget https://raw.githubusercontent.com/saaditory/scripts/master/microsoft-edge-dev.sh && ./microsoft-edge-dev.sh
xdg-settings set default-web-browser microsoft-edge-dev.desktop

# Install Essentials
sudo apt install gnome-tweaks gnome-shell-extensions neofetch preload synaptic timeshift vlc ubuntu-restricted-extras -y

# Display Syatem Information
neofetch
