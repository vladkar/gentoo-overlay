# star-overlay

Gentoo overlay for [LUG Helper](https://github.com/starcitizen-lug/lug-helper),
the Star Citizen Linux installation and management tool.

## Install

```sh
sudo eselect repository add star-overlay git \
  https://github.com/vladkar/star-overlay.git
sudo emaint sync -r star-overlay
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
