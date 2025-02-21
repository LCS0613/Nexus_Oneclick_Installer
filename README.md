# Nexus Installation Scripts

This repository contains installation scripts for Nexus on different Ubuntu versions. The scripts automate the installation process of Nexus and its dependencies.

## Available Scripts

- `install_nexus.sh` - For Ubuntu 24.04
- `install_nexus_ubuntu22.sh` - For Ubuntu 22.04

## Prerequisites

- Ubuntu 22.04 or 24.04
- Sudo privileges
- Internet connection

## Installation Steps

1. Clone this repository:
```
git clone https://github.com/LCS0613/Nexus_Oneclick_Installer
cd Nexus_Oneclick_Installer
```

2. Make the script executable:

Ubuntu 24.04:
```
chmod +x install_nexus.sh
```

Ubuntu 22.04:
```
chmod +x install_nexus_ubuntu22.sh
```

3. Run the installation script:

Ubuntu 24.04:
```
./install_nexus.sh
```

Ubuntu 22.04:
```
./install_nexus_ubuntu22.sh
```


## What the Script Does

1. Updates and upgrades system packages
2. Installs required dependencies
3. Creates a screen session
4. Installs Rust and sets up environment variables
5. Configures protoc
6. Sets up OpenSSL
7. Installs Nexus

## Interactive Steps

During the Nexus installation, you will need to:
1. Enter 'y' when prompted
2. Select option '2'
3. Enter your prover ID

## Screen Session Usage

- Access the screen session: `screen -r nexus`
- Exit the screen session: `Ctrl+A+D`

## Troubleshooting

If you encounter any issues:

1. Check if all prerequisites are met
2. Ensure you have stable internet connection
3. Verify your Ubuntu version
4. Check system resources

## Support

For issues and questions, please open an issue in this repository.

## License

This project is licensed under the MIT License - see the LICENSE file for details.