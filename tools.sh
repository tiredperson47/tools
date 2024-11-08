#!/bin/bash

# A script to quickly set up a Kali Linux machine, or any other Linux distribution that uses apt.

# Sets username variable to the user's username with whoami
username="$(whoami)"

# Parse command-line arguments
repositories=""
while getopts "r:" opt; do
  case $opt in
    r) repositories=$OPTARG ;;
    *) echo "Usage: $0 [-r repository1,repository2,...]"; exit 1 ;;
  esac
done

# Function to clone repositories
clone_repository() {
  case $1 in
    malsploits)
      git clone https://github.com/tiredperson47/malsploits.git ~/tools/malsploits
      ;;
    seclists)
      cd ~/tools
      wget https://github.com/danielmiessler/SecLists/archive/refs/heads/master.zip
      unzip master.zip
      mv SecLists-master SecLists
      ;;
    msfpayload)
      git clone https://github.com/tiredperson47/msfpayload.git ~/tools/msfpayload
      ;;
    *)
      echo "Unknown repository: $1"
      echo "Valid options are: malsploits, seclists, msfpayload"
      return 1
      ;;
  esac
  return 0
}

# If specific repositories are specified, only clone those
if [ -n "$repositories" ]; then
  IFS=',' read -ra repo_array <<< "$repositories"
  mkdir -p ~/tools
  all_valid=true
  for repo in "${repo_array[@]}"; do
    if ! clone_repository "$repo"; then
      all_valid=false
    fi
  done

  if $all_valid; then
    echo ""
    echo ""
    echo '============== Selected repositories cloned successfully! Good luck and happy hacking! =============='
  else
    echo ""
    echo "Some repositories were invalid. Please check the repository names and try again."
  fi
  exit 0
fi

# Continue with the full setup if no specific repositories were specified
# Ask user if they want to install SecLists and/or lxd privesc
read -p "Do you want to install SecLists? (y/n): " response1
sudo apt update
# Install required packages, gobuster, rlwrap, and remmina (RDP but kinda better than freexrdp)
sudo apt install -y ldap-utils gobuster remmina rlwrap

# install bopscrk (wordlist generator)
pip install bopscrk

# unzip rockyou.txt
sudo gunzip /usr/share/wordlists/rockyou.txt.gz

# Clone all GitHub repositories if no -r option was used
mkdir -p ~/tools
cd ~/tools
pip install bloodhound
git clone https://github.com/tiredperson47/malsploits.git

# Download and setup kerbrute
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -O kerbrute
chmod +x kerbrute

# Create linux-binary directory and download files
mkdir linux-binary
cd linux-binary
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_386.gz
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_amd64.gz
gunzip *.gz
mv chisel_1.9.1_linux_386 chisel32
mv chisel_1.9.1_linux_amd64 chisel64
git clone https://github.com/rebootuser/LinEnum.git
wget https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas.sh
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64
cd ..

# Create windows-binary directory and download files
mkdir windows-binary
cd windows-binary
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_windows_386.gz
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_windows_amd64.gz
gunzip *.gz
mv chisel_1.9.1_windows_386 chisel32
mv chisel_1.9.1_windows_amd64 chisel64
wget https://github.com/peass-ng/PEASS-ng/releases/download/20240519-fab0d0d5/winPEASx64.exe
git clone https://github.com/int0x33/nc.exe.git
git clone https://github.com/ParrotSec/mimikatz.git
wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Rubeus.exe
wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Certify.exe
wget https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/SharpHound.exe
git clone https://github.com/Kevin-Robertson/Powermad.git
wget https://github.com/PowerShellMafia/PowerSploit/raw/master/Recon/PowerView.ps1
cd ..

# create webapp directory which stores all webapp related tools
mkdir webapp
cd webapp
git clone https://github.com/BlackArch/webshells.git
git clone https://github.com/ambionics/phpggc.git
# Install google chrome to be able to use chrome debugger. (rare to use but still cool to have)
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
cd ..

# Create zerologon directory and download files
mkdir zerologon
cd zerologon
wget https://github.com/SecuraBV/CVE-2020-1472/raw/master/zerologon_tester.py
wget https://github.com/dirkjanm/CVE-2020-1472/raw/master/cve-2020-1472-exploit.py
wget https://github.com/dirkjanm/CVE-2020-1472/raw/master/restorepassword.py
touch Syntax-Notes
echo "for zerologon tester and exploit, it's: python3 (script) (NetBIOS name) (ip)" > Syntax-Notes
echo "for password restoring it's: python3 restorepassword.py (domain-name)/(NetBIOS name)@(NetBIOS name) -target-ip (ip) -hexpass (hex hash)" >> Syntax-Notes
cd ..

# Create rev-eng directory and download files
mkdir rev-eng
cd rev-eng
wget https://github.com/icsharpcode/AvaloniaILSpy/releases/download/v7.2-rc/Linux.x64.Release.zip
unzip Linux.x64.Release.zip
unzip ILSpy-linux-x64-Release.zip
cd ..

# Install bloodhound and neo4j
sudo apt install -y bloodhound neo4j

#my own repositoty
git clone https://github.com/tiredperson47/msfpayload.git

# installs seclists if user wants
if [[ "$response1" = "y" || "$response1" = "Y" ]]; then
    wget https://github.com/danielmiessler/SecLists/archive/refs/heads/master.zip
    unzip master.zip
    mv SecLists-master SecLists
else
    echo "No action taken for SecLists."
fi

# Recursively change permissions to be correct
sudo chown -R $username:$username ~/tools

echo ""
echo ""
echo '============== Good luck and happy hacking! =============='
