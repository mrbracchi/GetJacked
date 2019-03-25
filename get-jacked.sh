#!/bin/bash


#I am so lost on how Jack works. Just trying to take what Wes and the Gang already has going and make it work for my workflow using
#Ubuntu studio currently and attempting to use ardour5. Would like to pull things in like a soundboard and mumble room as well
#as seperate tracks in ardour

# load our jack session manager
#claudia &
#sleep 8

# clear any existing jack-pulse links
pacmd unload-module module-jack-sink
pacmd unload-module module-jack-source

#disclaimer-I HAVE NO IDEA WHAT I'M DOING
# configure pulse connectors
#commented out due to not using the JB soundboard-YET, I want to eventually
#pacmd load-module module-jack-source channels=1 source_name=soundboard-in client_name=soundboard-in connect=false
#pacmd load-module module-jack-sink channels=1 sink_name=soundboard-out client_name=soundboard-out connect=false

#changed to firefox just to see if it works. . . 
pacmd load-module module-jack-source channels=1 source_name=firefoc-in client_name=firefox-in connect=false
pacmd load-module module-jack-sink channels=1 sink_name=firefox-out client_name=firefox-out connect=false

#removed spotify and changed to pithos
pacmd load-module module-jack-source channels=1 source_name=pithos-in client_name=pithos-in connect=false
pacmd load-module module-jack-sink channels=1 sink_name=pithos-out client_name=pithos-out connect=false

# launch pulse applications
#commented out due to not being used
#PULSE_SINK=soundboard-out vlc &
PULSE_SINK=firefox-out firefox &

# launch jack applications-Switched REAPER/reaper to arduour5
~/bin/ardour5
