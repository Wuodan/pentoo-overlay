# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils git-r3

DESCRIPTION="Some tools for NetBIOS and DNS investigation, attacks, and communication"
HOMEPAGE="http://www.skullsecurity.org/wiki/index.php/Nbtool"
EGIT_REPO_URI="https://github.com/iagox86/${PN}.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare(){
	# respect CFLAGS and LDFLAGS
	sed -Ei 's#^\s+\$\{CC\} \$\{CFLAGS\}.* -o .*$#\0 \$\{LDFLAGS\}#' Makefile \
		|| die 'sed failed'
	default
}

src_install() {
	dobin nbquery nbsniff dnsxss dnslogger dnscat dnstest || die
	dodoc CHANGELOG TODO
}
