# install curl, git, ...
apt-get update

apt-get install -y \ 
   curl \ 
   git \ 
   gnupg2 \ 
   jq \ 
   sudo \ 
   zsh \ 
   vim \ 
   build-essential \ 
   openssl

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
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
## Install rustup and common components 
curl https://sh.rustup.rs -sSf | sh -s -- -y  
# Check rust version:
rustc --version

# rustup install nightly 
rustup component add rustfmt 
# rustup component add rustfmt --toolchain nightly 
rustup component add clippy  
# rustup component add clippy --toolchain nightly 
  
cargo install cargo-expand 
cargo install cargo-edit
cargo install cargo-add
