TERMUX_PKG_HOMEPAGE=https://github.com/charmbracelet/vhs
TERMUX_PKG_DESCRIPTION="Your CLI home video recorder"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux-user-repository"
TERMUX_PKG_VERSION="0.10.0"
TERMUX_PKG_SRCURL=https://github.com/charmbracelet/vhs/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=ae37fe7e52ade753f850ab81c7d5344f8e540ab6886f877bf5b613620c909893
TERMUX_PKG_DEPENDS="ttyd"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_configure(){
	termux_setup_golang
}

termux_step_make(){
	go build -o vhs
}

termux_step_make_install(){
	install -Dm755 -t "${TERMUX_PREFIX}"/bin vhs
}
