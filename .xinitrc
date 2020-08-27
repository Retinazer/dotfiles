dunst > /dev/null 2>&1 &
picom &
xwallpaper --daemon --zoom $HOME/pics/wall.png &

# to re-enable mouse acceleration on ThinkPad trackpoints
xinput --set-prop 'TPPS/2 IBM TrackPoint' 'libinput Accel Speed' 0 &

$HOME/.local/bin/dwmbar &
exec dwm
