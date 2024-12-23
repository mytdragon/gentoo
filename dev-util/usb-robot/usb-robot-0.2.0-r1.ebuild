# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs autotools

DESCRIPTION="USB Reverse engineering tools"
HOMEPAGE="https://usb-robot.sourceforge.net/"
SRC_URI="https://downloads.sourceforge.net/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"

DEPEND="virtual/libusb:0
	sys-libs/readline:="
RDEPEND="${DEPEND}"
PATCHES=(
	"${FILESDIR}/usb-robot-0.2.0-configure.patch"
	"${FILESDIR}/usb-robot-0.2.0-clang-warn.patch"
)

src_prepare() {
	default
	eautoreconf
}

src_compile() {
	emake CC="$(tc-getCC)"
}
