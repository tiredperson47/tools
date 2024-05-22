## Tools included:

- SecLists
- Gobuster
- Impacket
- Kerbrute
- CrackMapExec (I'm pretty sure this is already installed on Kali, but I added it anyways)
- Linux-Binary
  - Chisel (x32 and x64)
  - LinEnum
  - LinPEAS
- Windows-Binary
  - Mimikatz (x32 and x64)
  - NetCat (x32 and 64)
  - Rubeus
  - WinPEAS (x64)
  - Chisel (x32 and x64)
- ZeroLogon
  - PoC tester
  - Exploit script
  - Password Restore

## Before Running the Script:

These tools are for AMD64 based architecture Kali Linux. If you use a different distribution, architecture, or use x86 for some reason, then some of these tools may not install/work correctly. Some github tools offer versions for different linux distributions and architecture, so double checking the code to make sure you're machine is compatible would be best. 

This script uses sudo to download all of the tools. Be sure to have sudo permissions before attempting to run this script.
You may or may not need to add executable permissions to the scripts as well. 

SecLists isn't mentioned in the tools.sh script. Instead, it's in a separate file so that you can run it in a separate pane (with tmux or whatever). This is because SecLists is VERY large and can take a while.
If you're looking at this repository on github, here's the command for SecLists:

```
sudo git clone https://github.com/danielmiessler/SecLists.git
```
sudo is probably optional, but I like to use it just in case. 


## Disclaimer:

I do NOT own any of the tools that are in this script. All of the credit goes to their respective creators. This is simply a script to download them all rather than having to find them yourselves. 

I'm also NOT responsible for any misuse of the tools. These tools should be used for ethical purposes or on your own environment. 
