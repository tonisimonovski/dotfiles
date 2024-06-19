To add the Macedonian keyboard layout in i3wm and configure the shortcut to switch between the Macedonian and US keyboard layouts using Shift+Alt, follow these steps:

    Identify Layout Codes: Ensure you know the layout codes for both the Macedonian and US keyboard layouts. The layout code for Macedonian is typically mk, and for US English, it's us.

    Configure X11 Keyboard Settings: Open your terminal and run the following command to set up the Macedonian keyboard layout:

bash

setxkbmap mk

    Set Shortcut for Layout Switching: You can use tools like xbindkeys to set custom shortcuts. Install xbindkeys if you haven't already:

bash

sudo apt-get install xbindkeys

Create or edit the configuration file for xbindkeys:

bash

xbindkeys --defaults > ~/.xbindkeysrc

Edit ~/.xbindkeysrc and add the following lines:

plaintext

"xsetxkbmap -layout us"
    Shift + Alt_L

"xsetxkbmap -layout mk"
    Shift + Alt_R

This configuration will switch to the US keyboard layout when Shift + Left Alt is pressed and switch to the Macedonian layout when Shift + Right Alt is pressed. You might need to adjust these keys according to your keyboard layout and personal preference.

    Autostart Configuration: To ensure these settings are applied when i3wm starts, add the following lines to your i3 configuration file (~/.config/i3/config):

bash

exec --no-startup-id setxkbmap mk
exec --no-startup-id xbindkeys

This will set the Macedonian keyboard layout and start xbindkeys when i3wm starts.

    Reload i3wm: Save your i3wm configuration file and reload i3wm to apply the changes. You can do this by pressing Mod+Shift+R, where Mod is usually the Alt key unless you've configured it differently.

After these steps, you can use Shift + Alt to switch between the Macedonian and US keyboard layouts in i3wm. Adjust the shortcut keys in the ~/.xbindkeysrc file if necessary to match your preferences.