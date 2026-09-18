# star-overlay

A Gentoo overlay that extends the main package repository with one additional package:
[LUG Helper](https://github.com/starcitizen-lug/lug-helper), a tool for installing and managing Star Citizen on Linux.

## Install

```sh
# Add the overlay as an additional package repository.
sudo eselect repository add star-overlay git \
  https://github.com/vladkar/star-overlay.git

# Sync the overlay to fetch its package definitions.
sudo emaint sync -r star-overlay

# Install LUG Helper.
sudo emerge --ask games-util/lug-helper
```

Future updates are handled with normal repository synchronization and world
updates.

## Update the repo (for maintainers)

For a new upstream release, rename the ebuild to the upstream version and
regenerate the Manifest:

```sh
git mv games-util/lug-helper/lug-helper-4.16.ebuild \
  games-util/lug-helper/lug-helper-NEW_VERSION.ebuild
ebuild games-util/lug-helper/lug-helper-NEW_VERSION.ebuild manifest
pkgcheck scan
```

Commit the updated ebuild and Manifest.

## License

The overlay is licensed under GPL-2.0-only. LUG Helper is distributed separately
under GPL-3.0; see the upstream project for its source and license.
