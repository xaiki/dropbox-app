This repo contains a working version of the spotify x86-64 linux client packaged as an xdg-app.
Unfortunately there is no redistribution rights for the spotify binaries, so you have to create your own to use it.

The package uses the freedesktop.org runtime, so you first need to install the sdk (so you can build the bundled stuff) and the platform:
```
wget https://sdk.gnome.org/keys/gnome-sdk.gpg
flatpak --user remote-add --gpg-import=gnome-sdk.gpg gnome http://sdk.gnome.org/repo/
flatpak --user install gnome org.freedesktop.Sdk 1.4
flatpak --user install gnome org.freedesktop.Platform 1.4
```


To test this, do:
```
make
flatpak --user remote-add --no-gpg-verify local-spotify repo
flatpak --user install local-spotify com.spotify.Client
```
