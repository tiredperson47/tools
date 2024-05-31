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
  - Certify
  - WinPEAS (x64)
  - Chisel (x32 and x64)
  - Powermad
  - PowerView
  - SharpHound
- ZeroLogon
  - PoC tester
  - Exploit script
  - Password Restore
- Reverse Engineering
  - ILSpy (.NET rev eng tool)

## Before Running the Script:

Do NOT change the folder name/path before running the script. The script does it for you and will change the directory name to "github". If you do change the directory name/path, then run this command to fix ownership issues:
```
sudo chown -R (username):(username) (new directory path/name)
```

These tools are for AMD64 based architecture Kali Linux. If you use a different distribution, architecture, or use x86 for some reason, then some of these tools may not install/work correctly. Some github tools offer versions for different linux distributions and architecture, so double checking the code to make sure you're machine is compatible would be best. 

This script uses sudo to download all of the tools. Be sure to have sudo permissions before attempting to run this script.
You will need to add executable permissions to the tools.sh script as well. 

There maybe bugs in the code casue I'm a shit coder. So let me know if there are any problems. (or fix them yourselves idc)


## Disclaimer:

I do NOT own any of the tools that are in this script. All of the credit goes to their respective creators. This is simply a script to download them all rather than having to find them yourselves. 

I'm also NOT responsible for any misuse of the tools. These tools should be used for ethical purposes or on your own environment. 
