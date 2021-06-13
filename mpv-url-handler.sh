#!/bin/sh
mpv `echo -n $1 | sed 's/mpv:\/\///' | base64 --decode`
