# A script to quickly set up a kali linux machine, or any other linux distribution that uses apt. 

# Sets username variable to the user's username with whoami
username="$(whoami)"

sudo mv ~/kali-tools ~/github
sudo apt install -y ldap-utils
sudo apt install -y gobuster
sudo git clone https://github.com/byt3bl33d3r/CrackMapExec.git
#gets and installs requirements for impacket
sudo git clone https://github.com/fortra/impacket.git
sudo git clone https://github.com/BlackArch/webshells.git
sudo wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
	sudo mv kerbrute_linux_amd64 kerbrute
	sudo chmod +x kerbrute
sudo mkdir linux-binary
	cd linux-binary
	sudo wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_386.gz
	sudo wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_amd64.gz
	sudo gunzip * ~/tools
	sudo mv chisel_1.9.1_linux_386 lin-chisel32
	sudo mv chisel_1.9.1_linux_amd64 lin-chisel64
	sudo git clone https://github.com/rebootuser/LinEnum.git
	sudo wget https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas.sh
	cd ..
sudo mkdir windows-binary
	cd windows-binary
	sudo wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_windows_386.gz
        sudo wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_windows_amd64.gz
	sudo gunzip * ~/tools
        sudo mv chisel_1.9.1_windows_386 win-chisel32
       	sudo mv chisel_1.9.1_windows_amd64 win-chisel64
	sudo wget https://github.com/peass-ng/PEASS-ng/releases/download/20240519-fab0d0d5/winPEASx64.exe
	sudo git clone https://github.com/int0x33/nc.exe.git
	sudo git clone https://github.com/ParrotSec/mimikatz.git
	sudo wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Rubeus.exe
	sudo wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Certify.exe
 	sudo wget https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/SharpHound.exe
	sudo git clone https://github.com/Kevin-Robertson/Powermad.git
	sudo wget https://github.com/PowerShellMafia/PowerSploit/raw/master/Recon/PowerView.ps1
 	cd ..
sudo mkdir zerologon
	cd zerologon
	sudo wget https://github.com/SecuraBV/CVE-2020-1472/blob/master/zerologon_tester.py
	sudo wget https://github.com/dirkjanm/CVE-2020-1472/blob/master/cve-2020-1472-exploit.py
	sudo wget https://github.com/dirkjanm/CVE-2020-1472/blob/master/restorepassword.py
	touch Syntax-Notes
	echo "for zerologon tester and exploit, it's: python3 (script) (NetBIOS name) (ip)" > Syntax-Notes
	echo "for password restoring it's: python3 restorepassword.py (domain-name)/(NetBIOS name)@(NetBIOS name) -target-ip (ip) -hexpass (hex hash)" >> Syntax-Notes
	cd ..
 sudo mkdir rev-eng
 	cd rev-eng
  	sudo wget https://github.com/icsharpcode/AvaloniaILSpy/releases/download/v7.2-rc/Linux.x64.Release.zip
   	sudo unzip Linux.x64.Release.zip
    sudo unzip ILSpy-linux-x64-Release.zip
    cd ..

sudo apt install -y bloodhound neo4j

read -p "Do you want to install SecLists? (y/n): " response
if [ "$response" = "y" ]; then
    sudo wget https://github.com/danielmiessler/SecLists/archive/refs/heads/master.zip
	echo ""
	echo ""
	echo "You have to unzip Seclists yourself. Shouldn't take long. Maybe 45 seconds?"
else
    echo "No action taken. Exiting."
fi

cd ..
# Recursivly change permissions to be correct
sudo chown -R $username:$username ~/github

echo ""
echo ""
echo "Good luck and happy hacking!"

