#!/bin/bash

# Color definitions
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Starting Nexus Installation Script for Ubuntu 22.04...${NC}"

# 1.1 Basic setup and package installation
echo -e "${GREEN}Installing basic packages...${NC}"
sudo apt update && sudo apt upgrade -y
sudo apt install screen build-essential pkg-config libssl-dev git-all pkgconf cmake -y
sudo apt install protobuf-compiler -y  # Protobuf compiler for Ubuntu 22.04

# 1.2 Create screen session
echo -e "${GREEN}Creating screen session...${NC}"
screen -dmS nexus

# 2. Install RUST (Ubuntu 22.04 stable version)
echo -e "${GREEN}Installing Rust...${NC}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y

# 2.2 Set RUST environment variables
echo -e "${GREEN}Setting up Rust environment variables...${NC}"
source $HOME/.cargo/env
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
# Modify zshrc only if it exists
if [ -f ~/.zshrc ]; then
    echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc
fi
source ~/.bashrc
rustup update

# 3. Setup protoc (Ubuntu 22.04 method)
echo -e "${GREEN}Setting up protoc...${NC}"
# Use Ubuntu 22.04's default protoc
sudo apt install -y protobuf-compiler libprotobuf-dev
protoc --version

# 4. Check and setup OpenSSL dependencies
echo -e "${GREEN}Checking OpenSSL configuration...${NC}"
sudo apt install -y libssl-dev
export OPENSSL_DIR=/usr
export PKG_CONFIG_PATH=/usr/lib/pkgconfig

# 5. Install nexus
echo -e "${GREEN}Installing Nexus...${NC}"
echo "Please follow these steps during installation:"
echo "1. Enter 'y' when prompted"
echo "2. Select option '2'"
echo "3. Enter your prover ID"
curl https://cli.nexus.xyz/ | sh

echo -e "${GREEN}Installation completed!${NC}"
echo -e "${GREEN}Use 'screen -r nexus' command to access the created screen session${NC}"
echo -e "${GREEN}To exit screen session: Ctrl+A+D${NC}" 