Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" –Value 0
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -name "UserAuthentication" -Value 0
Enable-NetFirewallRule -DisplayGroup "Távoli asztal"
net accounts /MAXPWAGE:UNLIMITED
powercfg /HIBERNATE OFF
restart-computer