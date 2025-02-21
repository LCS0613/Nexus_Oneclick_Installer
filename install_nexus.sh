#!/bin/bash

# Color definitions
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Starting Nexus Installation Script...${NC}"

# 1.1 Basic setup and package installation
echo -e "${GREEN}Installing basic packages...${NC}"
sudo apt update && sudo apt upgrade -y
sudo apt install screen build-essential pkg-config libssl-dev git-all pkgconf -y

# 1.2 Create screen session
echo -e "${GREEN}Creating screen session...${NC}"
screen -dmS nexus

# 2. Install RUST
echo -e "${GREEN}Installing Rust...${NC}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# 2.2 Set RUST environment variables
echo -e "${GREEN}Setting up Rust environment variables...${NC}"
source $HOME/.cargo/env
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc 2>/dev/null
source ~/.bashrc
rustup update

# 3. Install protoc
echo -e "${GREEN}Installing protoc...${NC}"
curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v29.1/protoc-29.1-linux-x86_64.zip
sudo apt install unzip -y
unzip protoc-29.1-linux-x86_64.zip -d $HOME/.local
export PATH="${HOME}/.local/bin:${PATH}"
echo 'export PATH="${HOME}/.local/bin:${PATH}"' >> ~/.bashrc
source ~/.bashrc

# 4. Install nexus
echo -e "${GREEN}Installing Nexus...${NC}"
echo "During installation, select 'y', then choose '2', and enter your prover ID."
curl https://cli.nexus.xyz/ | sh

echo -e "${GREEN}Installation completed!${NC}"
echo -e "${GREEN}You can access the created screen session using 'screen -r nexus' command${NC}" 