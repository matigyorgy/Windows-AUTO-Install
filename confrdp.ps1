Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" –Value 0
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -name "UserAuthentication" -Value 0
Enable-NetFirewallRule -DisplayGroup "Távoli asztal"
net accounts /MAXPWAGE:UNLIMITED
powercfg /HIBERNATE OFF
powercfg -SETACTIVE scheme_min


Set oWMP = CreateObject("WMPlayer.OCX.7")
Set colCDROMs = oWMP.cdromCollection

if colCDROMs.Count > 0 then
	for i = 0 to colCDROMs.Count - 1
		colCDROMs.Item(i).Eject
	next
End If
oWMP.close

restart-computer
