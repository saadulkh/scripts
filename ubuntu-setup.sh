# A shell script to setup Ubuntu after a fresh install.
# Created by Saad Khan on April 01, 2021.

# Configure System Settings
gsettings set org.gnome.desktop.interface enable-hot-corners true
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'suspend'
sudo sed -i.bak "/^#HandleLidSwitch=/ s/^#.*/HandleLidSwitch=lock/" /etc/systemd/logind.conf

# Configure Shell Settings
gsettings set org.gnome.desktop.interface clock-format '12h'
gsettings set org.gtk.Settings.FileChooser clock-format '12h'
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Configure Locale Settings
dbus-send --print-reply --system --dest=org.freedesktop.Accounts /org/freedesktop/Accounts/User$UID org.freedesktop.Accounts.User.SetFormatsLocale string:'en_GB.UTF-8'
sudo sed -i.bak "/LC_/ s/=.*/=en_GB.UTF-8/" /etc/default/locale
gsettings set org.gnome.system.locale region 'en_GB.UTF-8'

# Debloate System
sudo apt purge aisleriot gnome-characters gnome-font-viewer gnome-logs gnome-mahjongg gnome-mines gnome-sudoku gnome-todo remmina rhythmbox seahorse simple-scan totem transmission-common yelp -y
sudo apt auto-remove -y

# Enable Partner Repositories
sudo sed -i.bak "/^# deb .*partner/ s/^# //" /etc/apt/sources.list

# Update and Upgrade System
sudo apt update && sudo apt upgrade -y

# Install MS Edge Browser
wget -nc https://raw.githubusercontent.com/saaditory/scripts/master/microsoft-edge-dev.sh
chmod 777 microsoft-edge-dev.sh && ./microsoft-edge-dev.sh
xdg-settings set default-web-browser microsoft-edge-dev.desktop

# Install Essentials
sudo apt install gnome-tweaks gnome-shell-extensions neofetch preload synaptic timeshift vlc ubuntu-restricted-extras -y

# Display Syatem Information
neofetch
