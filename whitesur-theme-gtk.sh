# A shell script to install & setup WhiteSur theme on GTK.
# WhiteSur-gtk-theme: https://github.com/vinceliuice/WhiteSur-gtk-theme
# WhiteSur-icon-theme: https://github.com/vinceliuice/WhiteSur-icon-theme
# Created by Saad Khan on April 01, 2021.

# Install Dash to Dock
xdg-open https://extensions.gnome.org/extension/307/dash-to-dock/

# Install WhiteSur-gtk-theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
sudo ./WhiteSur-gtk-theme/install.sh --dest $HOME/.themes --opacity solid --icon ubuntu --gdm
sudo flatpak override --filesystem=~/.themes

# Apply WhiteSur-gtk-theme
gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-dark-solid'
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gsettings set org.gnome.shell.extensions.user-theme name 'WhiteSur-dark-solid'

# Install WhiteSur dash-to-dock theme
./WhiteSur-gtk-theme/src/other/dash-to-dock/install.sh

# Apply & Configure WhiteSur dash-to-dock theme
gnome-extensions disable ubuntu-dock@ubuntu.com
gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false

# Install WhiteSur-icon-theme
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
./WhiteSur-icon-theme/install.sh

# Apply WhiteSur-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur-dark'

# Remove Leftover
rm -rf WhiteSur-gtk-theme WhiteSur-icon-theme
