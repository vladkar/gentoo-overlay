# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg

DESCRIPTION="Helper for installing and managing Star Citizen on Linux"
HOMEPAGE="https://github.com/starcitizen-lug/lug-helper"
SRC_URI="https://github.com/starcitizen-lug/lug-helper/releases/download/v${PV}/${PN}-v${PV}.tar.gz"

S="${WORKDIR}/${PN}-v${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+gui +polkit"

RDEPEND="
	app-arch/cabextract
	app-arch/gzip
	app-arch/tar
	app-arch/unzip
	app-arch/xz-utils
	app-arch/zstd
	app-shells/bash
	net-misc/curl
	sys-apps/coreutils
	sys-apps/findutils
	x11-misc/xdg-utils
	gui? ( gnome-extra/zenity )
	polkit? ( sys-auth/polkit )
"

src_install() {
	newbin lug-helper.sh lug-helper

	exeinto "/usr/share/${PN}"
	doexe lib/sc-launch.sh

	newicon -s 256 lug-logo.png lug-helper.png
	newicon -s 256 rsi-launcher.png rsi-launcher.png
	newicon -s 256 starcitizen.png starcitizen.png
	domenu "${FILESDIR}/lug-helper.desktop"

	dodoc README.md
}
