# Keyboard layout
setxkbmap dvorak

# Xresources
xrdb -merge ~/.Xresources

# Compton
compton --config .config/compton.conf -b

# Wallpaper
~/.fehbg &

# XMonad
exec xmonad
