#!/bin/bash

# A script to quickly set up a Kali Linux machine, or any other Linux distribution that uses apt. 

# Sets username variable to the user's username with whoami
username="$(whoami)"

# Install required packages
sudo apt install -y ldap-utils gobuster

# Clone GitHub repositories
cd ~/github
git clone https://github.com/byt3bl33d3r/CrackMapExec.git
git clone https://github.com/fortra/impacket.git
git clone https://github.com/BlackArch/webshells.git

# Download and setup kerbrute
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -O kerbrute
chmod +x kerbrute

# Create linux-binary directory and download files
mkdir linux-binary
cd linux-binary
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_386.gz
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_amd64.gz
gunzip *.gz
mv chisel_1.9.1_linux_386 lin-chisel32
mv chisel_1.9.1_linux_amd64 lin-chisel64
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
mv chisel_1.9.1_windows_386 win-chisel32
mv chisel_1.9.1_windows_amd64 win-chisel64
wget https://github.com/peass-ng/PEASS-ng/releases/download/20240519-fab0d0d5/winPEASx64.exe
git clone https://github.com/int0x33/nc.exe.git
git clone https://github.com/ParrotSec/mimikatz.git
wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Rubeus.exe
wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Certify.exe
wget https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/SharpHound.exe
git clone https://github.com/Kevin-Robertson/Powermad.git
wget https://github.com/PowerShellMafia/PowerSploit/raw/master/Recon/PowerView.ps1
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

# Prompt for SecLists installation
cd ~/github
read -p "Do you want to install SecLists? (y/n): " response
if [ "$response" = "y" ]; then
    wget https://github.com/danielmiessler/SecLists/archive/refs/heads/master.zip
    echo ""
    echo ""
    echo "You have to unzip SecLists yourself. Shouldn't take long. Maybe 45 seconds?"
else
    echo "No action taken. Exiting."
fi

# Recursively change permissions to be correct
sudo chown -R $username:$username ~/github

echo ""
echo ""
echo '============== Good luck and happy hacking! =============='
