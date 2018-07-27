#!/bin/bash

getip() {
  localIP=$(ipconfig getifaddr en0)

  if [ -z "$localIP" ] ; then
    localIP=$(ipconfig getifaddr en1)
  else
    return
  fi

  if [ -z "$localIP" ] ; then
    for i in $(networksetup -listallhardwareports | grep Device | awk '{print $2}' | grep -v "en0\|en1"); do
      localIP=$(ipconfig getifaddr $i)
      if [ ! -z "$localIP" ] ; then
        return
      fi
    done
  fi
  echo "can't find local IP"
  exit 1
}

startcontainer() {
  docker run --hostname linux-games --user ubuntu -it -e DISPLAY=$localIP:0 -e XAUTHORITY=~/.Xauthority -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.Xauthority:/.Xauthority gnome-games $1
}

getip
xhost + $localIP &> /dev/null

if [ -z "$@" ] ; then
  startcontainer bash
else
  startcontainer $@
fi
