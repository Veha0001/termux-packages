TERMUX_PKG_HOMEPAGE=https://github.com/charmbracelet/vhs
TERMUX_PKG_DESCRIPTION="Your CLI home video recorder"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux-user-repository"
TERMUX_PKG_VERSION="0.10.0"
TERMUX_PKG_SRCURL=git+https://github.com/charmbracelet/vhs
TERMUX_PKG_GIT_BRANCH="v${TERMUX_PKG_VERSION}"
TERMUX_PKG_DEPENDS="ttyd"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_UPDATE_TAG_TYPE="latest-release-tag"

termux_step_configure(){
	termux_setup_golang
}

termux_step_make(){
	sed -i 's|path, _ := launcher.LookPath()|path := "${TERMUX_PREFIX}/bin/chromium-browser"|' $TERMUX_PKG_SRCDIR/vhs.go
	go build -o vhs -ldflags "-compressdwarf=false \
	-X main.Version=${TERMUX_PKG_VERSION} \
	-X main.CommitSHA=$(git rev-parse HEAD) \
	-X main.CommitDate=$(git show --no-patch --format=%cd --date=format:%Y-%m-%d)"
}

termux_step_make_install(){
	install -Dm755 -t "${TERMUX_PREFIX}"/bin vhs
}
