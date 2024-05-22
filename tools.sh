# A script to quickly set up a kali linux machine, or any other linux distribution that uses apt. 


sudo apt install -y gobuster
#gets adn installs requirements for impacket
sudo git clone https://github.com/fortra/impacket.git
	cd impacket
	sudo pip3 install -r requirements.txt
	sudo python3 pip install setup.py
	sudo pip install impacket
  cd ..
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
	mv kerbrute_linux_amd64 kerbrute
	chmod +x kerbrute
mkdir linux-binary
	cd linux-binary
	wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_386.gz
	wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_amd64.gz
	sudo gunzip * ~/tools
	mv chisel_1.9.1_linux_386 lin-chisel32
	mv chisel_1.9.1_linux_amd64 lin-chisel64
	sudo git clone https://github.com/rebootuser/LinEnum.git
	wget https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas.sh
	cd ..
mkdir windows-binary
	cd windows-binary
	wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_windows_386.gz
        wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_windows_amd64.gz
	sudo gunzip * ~/tools
        mv chisel_1.9.1_windows_386 win-chisel32
        mv chisel_1.9.1_windows_amd64 win-chisel64
	wget https://github.com/peass-ng/PEASS-ng/releases/download/20240519-fab0d0d5/winPEASx64.exe
	sudo git clone https://github.com/int0x33/nc.exe.git
	sudo git clone https://github.com/ParrotSec/mimikatz.git
	wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/blob/master/Rubeus.exe
	cd ..
mkdir zerologon
	cd zerologon
	wget https://github.com/SecuraBV/CVE-2020-1472/blob/master/zerologon_tester.py
	wget https://github.com/dirkjanm/CVE-2020-1472/blob/master/cve-2020-1472-exploit.py
	wget https://github.com/dirkjanm/CVE-2020-1472/blob/master/restorepassword.py
	touch Syntax-Notes
	echo "for zerologon tester and exploit, it's: python3 (script) (NetBIOS name) (ip)" > Syntax-Notes
	echo "for password restoring it's: python3 restorepassword.py (domain-name)/(NetBIOS name)@(NetBIOS name) -target-ip (ip) -hexpass (hex hash)" >> Syntax-Notes
	cd ..
sudo apt-get install -y bloodhound neo4j
curl --request GET \ --url 'https://www.tenable.com/downloads/api/v2/pages/nessus/files/Nessus-10.7.3-debian10_amd64.deb' \ --output 'Nessus-10.7.3-debian10_amd64.deb'

echo "I won't unzip/start nessus for you because it is quite big. However, here is the debian based, AMD64 architecture Nessus Essentials. If you need ARM or want to set it up, look up how yourself." 
