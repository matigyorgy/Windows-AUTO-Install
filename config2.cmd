Enable-NetFirewallRule -DisplayGroup "Távoli asztal"
netsh advfirewall firewall set rule group="Távoli asztal" new enable=yes
netsh advfirewall firewall add rule name="Open Port 3389" dir=in action=allow protocol=TCP localport=3389

:: License Add
cscript C:\Windows\System32\slmgr.vbs /upk
cscript C:\Windows\System32\slmgr.vbs /cpky
cscript C:\Windows\System32\slmgr.vbs /ipk 88XQ9-BKFK3-7BWVR-43839-FWW9K
cscript C:\Windows\System32\slmgr.vbs /ato
