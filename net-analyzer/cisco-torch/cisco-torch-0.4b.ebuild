# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Cisco mass scanning, fingerprinting, and exploitation tool"
HOMEPAGE="http://www.arhont.com/en/category/resources/tools-utilities/"
# SRC_URI="http://www.arhont.com/en/wp-content/uploads/2010/01/${P}.tar.gz"
SRC_URI="https://github.com/foreni-packages/${PN}/archive/upstream/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-perl/Net-Telnet
	dev-perl/Net-SSH-Perl
	dev-perl/Net-SNMP
	dev-perl/Net-SSLeay"

src_prepare() {
	sed -i 's|torch.conf|/etc/torch.conf|g' cisco-torch.pl || die
	sed -i 's|DIR, "include"|DIR, "/usr/share/cisco-torch/include"|' cisco-torch.pl || die
	sed -i 's|include/$in|$in|' cisco-torch.pl || die
	sed -i "25i\use lib '/usr/share/cisco-torch/include/';" cisco-torch.pl|| die
	default
}

src_install() {
	insinto /usr/share/${PN}
	doins -r include tftproot brutefile.txt community.txt fingerprint.db \
	password.txt tfingerprint.db users.txt || die
	insinto /etc
	doins torch.conf || die
	dobin cisco-torch.pl || die
	dodoc README.txt TODO CHANGELOG.txt
}
