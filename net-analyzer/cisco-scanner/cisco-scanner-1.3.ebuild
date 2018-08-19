# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="scan a network for cisco routers with default passwords"
HOMEPAGE="http://packetstormsecurity.org/cisco/ciscos.c"
SRC_URI="https://dl.packetstormsecurity.net/cisco/ciscos.c"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}"/ciscos.c "${WORKDIR}"/ || die
}

src_compile() {
	$(tc-getCC) $CFLAGS ciscos.c -o ciscos $LDFLAGS || die
}

src_install() {
	dobin ciscos || die
}
