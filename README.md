# syncItunes2Mtp
Tool to synchronize an iTunes music library (music, playlist, other) with an MTP device and guidelines for day to day scenarios.
(In fact, it can synchronize with any available mount point)

## Why such another tool ?
1. Handle music and audiobooks (or podcasts,...) separately (easy random on all music)
2. Update playlists when they change (I had an annoying bug in SonyBridge software for instance)
3. Avoid activating 'usb debugging' for syncing an Android device

## Target scenario
1. MacOS with iTunes
   1. All music stored in Itunes media folder (iTunes Media/Music)
   1. All other audio files stored somewhere else
1. Android device
   1. Compatible with MortPlay music player (to be installed)
   1. Compatible with VLC or another directory based audio player (for audiobooks)
  
## My config
* MacbookAir 11', macOS high Sierra
* Fairphone 2, Android 6
* USB cable

## Related projects (integrated into this solution)
* [osxfuse](https://github.com/osxfuse/osxfuse)
* [simple-mtpfs](https://github.com/phatina/simple-mtpfs)
* [itunesexport](http://www.ericdaugherty.com/dev/itunesexport/)
* [rsync](https://rsync.samba.org/)

# Setup
## Install required stuff on macOS
### MTP connection
  1. Install osxfuse (https://github.com/osxfuse/osxfuse/releases/download/osxfuse-3.7.1/osxfuse-3.7.1.dmg)
  2. Install simple-mtpfs
  3. If not yet installed, install homebrew : https://brew.sh/
  4.  `brew install simple-mtpfs`
### Playlist management
  1. Download itunesexport : https://sourceforge.net/projects/itunesexport/files/iTunesExport/2.2.2/iTunesExportScala-2.2.2.zip/download
  2. Unzip into /Applications/
  
## Adapt script variables to your needs
Look at script headers and adapt it to your environment

## Install required stuff on Android
1. Install [MortPlayer](https://play.google.com/store/apps/details?id=de.stohelit.folderplayer)
   1. Configure it to look in the music folder (OUTPUT_MUSIC var in script)
1. Install [VLC](https://play.google.com/store/apps/details?id=org.videolan.vlc)

# Run script and ENJOY ;-)
1. Plug your smartphone on USB and activate 'MTP'
1. Start script : ./syncItunes2Mtp.sh
1. Wait for sync
1. Enjoy your audio content from your player !
