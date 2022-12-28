# install curl, git, ...
apt-get update
apt-get install -y curl git jq

useradd -m user
su user

# install go
VERSION='1.19'
OS='linux'
ARCH='amd64'

curl -OL https://dl.google.com/go/go${VERSION}.${OS}-${ARCH}.tar.gz
tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
rm go$VERSION.$OS-$ARCH.tar.gz

INSTALLED_GO_VERSION=$(go version)
echo "Go version ${INSTALLED_GO_VERSION} is installed"

# install gopls, dlv, hey
echo "Getting development tools"
go install golang.org/x/tools/gopls@latest -y
go install github.com/go-delve/delve/cmd/dlv@latest -y

# vscode-go dependencies 
# echo "Getting dependencies for the vscode-go plugin "
# via: https://github.com/microsoft/vscode-go/blob/master/.travis.yml

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Check rust version:
rustc --version
