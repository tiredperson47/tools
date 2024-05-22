## Before Running the Script:

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
