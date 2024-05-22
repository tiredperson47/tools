# A script to quickly set up a kali linux machine, or any other linux distribution that uses apt. 
echo "what is your username? (this is for file ownership stuff)"
read username

sudo apt install -y gobuster
sudo git clone https://github.com/byt3bl33d3r/CrackMapExec.git
#gets and installs requirements for impacket
sudo git clone https://github.com/fortra/impacket.git
	cd impacket
	pip3 install -r requirements.txt
	python3 pip install setup.py
	pip install impacket
	cd ..
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
	sudo wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/blob/master/Rubeus.exe
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
sudo apt-get install -y bloodhound neo4j

cd ..
sudo chown -R $username:$username ~/Kali-Setup
sudo mv ~/Kali-Setup ~/github
