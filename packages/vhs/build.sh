TERMUX_PKG_HOMEPAGE=https://github.com/charmbracelet/vhs
TERMUX_PKG_DESCRIPTION="Your CLI home video recorder"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux-user-repository"
TERMUX_PKG_VERSION="0.10.0"
TERMUX_PKG_SRCURL=https://github.com/charmbracelet/vhs/releases/download/v${TERMUX_PKG_VERSION}/vhs-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=d971df9d2ec365db116c3c770aee25bcfb87082fc19e808209766bb4f6561cab
TERMUX_PKG_DEPENDS="ttyd"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_configure(){
	termux_setup_golang
}

termux_step_make(){
	sed -i 's|path, _ := launcher.LookPath()|path := "${TERMUX_PREFIX}/bin/chromium-browser"|' vhs.go
	go build -o vhs
}

termux_step_make_install(){
	install -Dm755 -t "${TERMUX_PREFIX}"/bin vhs
}
