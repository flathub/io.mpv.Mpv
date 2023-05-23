# mpv - a free, open source, and cross-platform media player - Built for flatpak

https://mpv.io/

## Information for Users

### Installation

Follow [this](https://flatpak.org/setup/) guide to install flatpak and setup the flathub repository.

You can then install mpv various ways:

By visiting https://flathub.org/apps/details/io.mpv.Mpv and clicking install, this will open Discover, Gnome Software or another GUI package installation program.

By using a GUI package installation program like Discover or Gnome Software, search for mpv and click install.

By using a command line interface:

Install only for your user: `flatpak --user install io.mpv.Mpv`

Install systemwide: `sudo flatpak install io.mpv.Mpv`

### Running

From a command line:

`flatpak run io.mpv.Mpv`

You can also create an alias by running the following command:

`echo "alias mpv='flatpak run io.mpv.Mpv" >> ~/.bashrc && source ~/.bashrc`

Then you can use the command `mpv` in a terminal.

Another method is creating an executable shell script called `mpv` inside of your path with the following:
```
echo "
#!/bin/sh
flatpak run io.mpv.Mpv "$@"
" > mpv
```

make sure to make the script executable with `chmod a+rx mpv`

## Information for Developers / Testers

### io.mpv.Mpv.appdata.xml

The date and version are automatically updated when building mpv.

### Building from source

If you want to test changes to the io.mpv.Mpv.yml file you can build this repository from source.

Install `flatpak-builder` using your package manager. If it's not available, install it through flatpak: `flatpak install flathub org.flatpak.Builder`

Download the SDK used by io.mpv.Mpv.yml (see the file for the current version):

`flatpak --user install flathub org.freedesktop.Platform//22.08 org.freedesktop.Sdk//22.08`

Clone this repository:

`git clone https://github.com/flathub/io.mpv.Mpv.git`

`cd io.mpv.Mpv`

Build and install the project:

`flatpak-builder --user --install --force-clean build-dir io.mpv.Mpv.yml`

If you're testing changes and don't want to recheck any of the remote sources:

`flatpak-builder --user --install --force-clean --disable-download build-dir io.mpv.Mpv.yml`

### Locally testing the x-checker-data

Install flatpak-external-data-checker:

`flatpak install --from https://dl.flathub.org/repo/appstream/org.flathub.flatpak-external-data-checker.flatpakref`

Clone this repository:

`git clone https://github.com/flathub/io.mpv.Mpv.git`

Run flatpak-external-data-checker:

`flatpak run --filesystem="$(realpath io.mpv.Mpv)" org.flathub.flatpak-external-data-checker io.mpv.Mpv/io.mpv.Mpv.yml`

If you run into errors and want more verbose output, append the `-v` flag:

`flatpak run --filesystem="$(realpath io.mpv.Mpv)" org.flathub.flatpak-external-data-checker io.mpv.Mpv/io.mpv.Mpv.yml -v`
