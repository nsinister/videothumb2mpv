# videothumb2mpv

## What is it?
A browser userscript that will allow you to open videos in external player mpv by simply clicking on a thumbnail without loading bloated video page with web player.

## How it works?
It simply replaces video thumbnail hyperlinks on a page, changing their protocol from https:// to mpv:// and coding the original URL as base64. The result string is then passed to mpv:// URI handler as base64 string. 

[Demonstration](https://imgur.com/kUrRmaJ)

## Supported resources

* YouTube
* Vimeo

Potentially it works with anything that mpv and its youtube-dl backend supports. But in order to add support for a certain website, one needs to find its DOM selector for site specific video thumbnails and put it into the dictionary inside the userscript

## Prerequisites
* Any modern web browser that supports extensions 
* [mpv media player](https://mpv.io/)
* [youtube-dl](https://youtube-dl.org/)
* Userscript manager, such as [Violentmonkey](https://violentmonkey.github.io/), [Greasemonkey](https://www.greasespot.net/) or [Tampermonkey](https://www.tampermonkey.net/)

## Installation

1. Clone this repository
1. Do one of the following:
    1. Install script from [Greasyfork](https://greasyfork.org/en/scripts/427882-click-on-video-thumbnail-to-play-in-mpv) or [OpenUserJS](https://openuserjs.org/scripts/nsinister/Click_on_video_thumbnail_to_play_in_MPV)
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
1. Download Windows archive for your architecture from [mpv-url-handler repository](https://github.com/nsinister/mpv-url-handler/releases)
1. Unzip the downloaded archive to mpv installation folder
1. Download [handler-install.bat](https://github.com/akiirui/mpv-handler/blob/main/share/windows/handler-install.bat) script from [mpv-handler by  akiirui](https://github.com/akiirui/mpv-handler) repository.
1. Copy handler-install.bat into mpv folder
1. Run handler-install.bat to register protocol handler (as Administrator)

If it does not work, add MPV folder to your PATH environment variable. (requires administrator rights)

```cmd
set PATH=%PATH%;C:\your\path\to\mpv\folder\here\
```

## Limitations
* Live streams aren't fully supported by mpv + youtube-dl, thus you may want to avoid clicking on live stream thumbnails
* Cookies are not passed in any way, hence private vidoes (subscriber only) won't play
* Video quality is automatically chosen by MPV, so you can configure MPV to your liking (see notes below)

## Known bugs
New video links are not generated after consequent search on YouTube
When you Search on YouTube consequently, it doesn't reload page, so previous links are preserved as onclick events. Workaround: reload page after you performed Search.

## Notes
Tested and confirmed working in the following setups:
* GNU/Linux with Xorg, Mozilla Firefox, Violentmonkey
* Windows 32-bit, Chrome, Tampermonkey
* Windows 64-bit, Firefox, Violentmonkey

For better experience you may want to set max quality in mpv config. For example: you want vidoes to be viewable in not higher than 1080p.

To accomplish that, edit file ~/.config/mpv/mpv.conf in GNU/Linux or mpv.conf in your mpv folder (create file if not exists). 
Add the following line in mpv.conf
```
ytdl-format=bestvideo[height<=1080]+bestaudio
```
