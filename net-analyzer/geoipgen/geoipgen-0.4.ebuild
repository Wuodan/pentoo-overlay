# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Generate a list of hostnames based on country"
HOMEPAGE="http://www.morningstarsecurity.com/research/geoipgen"
# SRC_URI="http://geoipgen.googlecode.com/files/$P.tar.gz"
SRC_URI="https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${PN}/${P}.tar.gz"

LICENSE="BSD CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/ruby
		 dev-libs/geoip
		 app-arch/unzip"

src_prepare() {
	# fix db path
	sed -i 's|/usr/local/share/|/etc/maxmind/|g' ${PN} || die
	default
}

src_install() {
	dobin ${PN} || die
	dodoc README CHANGELOG TODO
}

pkg_postinst() {
	einfo "For ${PN} to work you have to download"
	einfo "http://www.maxmind.com/download/geoip/database/GeoIPCountryCSV.zip"
	einfo "save it to /etc/maxmind and unzip it"
}
