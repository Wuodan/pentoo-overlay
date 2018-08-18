# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
EGO_PN=github.com/madengr/${PN}

inherit python-single-r1 python-utils-r1

if [[ ${PV} = *9999* ]]; then
        inherit git-r3
        EGIT_REPO_URI="https://github.com/madengr/ham2mon.git"
        KEYWORDS=""
else
        KEYWORDS="~amd64 ~x86"
        EGIT_COMMIT="d15fd94b253a1a854a7f106dd105a3d83dcbee00"
        SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="A GNU Radio (GR) based SDR scanner with a Curses interface."
HOMEPAGE="https://github.com/madengr/ham2mon"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="~dev-lang/python-2.7"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${EGIT_COMMIT}"

src_install(){
        newbin apps/"${PN}".py "${PN}"
		python_fix_shebang "${ED}"usr/bin
		python_domodule apps/*.py
}

