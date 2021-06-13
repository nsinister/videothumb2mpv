# videothumb2mpv

## What is it?
A browser userscript that will allow you to open videos in external player mpv by simply clicking on a thumbnail without loading bloated video page with web player.

## How it works?
It simply replaces video thumbnail hyperlinks on a page, changing their protocol from https:// to mpv:// and coding the original URL as base64. The result string is then passed to mpv:// URI handler as base64 string. 

## Supported resources

* YouTube
* Vimeo

Potentially it works with anything that mpv and its youtube-dl backend supports. But in order to add support for a certain website, one needs to find its DOM selector for site specific video thumnails and put it into the dictionary inside the userscript

## Prerequisites
* Any modern web browser that supports extensions 
* [mpv media player](https://mpv.io/)
* [youtube-dl](https://youtube-dl.org/)
* Userscript manager, such as [Violentmonkey](https://violentmonkey.github.io/), [Greasemonkey](https://www.greasespot.net/) or [Tampermonkey](https://www.tampermonkey.net/)

## Installation

1. Clone this repository
1. Create a script in your browser userscript manager and paste contents of userscript.js from this repository
1. Make sure the userscript is enabled
1. Install mpv URL handler using the commands below

### GNU/Linux

```sh
$ chmod +x install.sh
$ ./install.sh
```
### Windows
1. Ensure you have [mpv](https://sourceforge.net/projects/mpv-player-windows/files/) and [youtube-dl](http://ytdl-org.github.io/youtube-dl/download.html) extracted in the same folder.
1. Download latest release for Windows from [mpv-handler by akiirui repository](https://github.com/akiirui/mpv-handler/releases)
1. Unzip the downloaded archive to mpv installation folder
1. Run handler-install.bat to register protocol handler

If you are on Windows 32-bit, there is no binary in akiirui's repository for Win32, you can use my version of [mpv-handler for Win32](https://github.com/nsinister/mpv-url-handler/releases)


## Notes
Confirmed working the following setups:
* GNU/Linux with Xorg, Mozilla Firefox, Violentmonkey
* Windows, Chrome, Tampermonkey


