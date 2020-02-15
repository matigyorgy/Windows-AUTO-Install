netsh advfirewall firewall add rule name="Open Port 3389" dir=in action=allow protocol=TCP localport=3389
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp /t REG_DWORD /d 1 /f

Set oWMP = CreateObject("WMPlayer.OCX.7")
Set colCDROMs = oWMP.cdromCollection

if colCDROMs.Count > 0 then
	for i = 0 to colCDROMs.Count - 1
		colCDROMs.Item(i).Eject
	next
End If
oWMP.close

net accounts /MAXPWAGE:UNLIMITED
powercfg /HIBERNATE OFF
powercfg -SETACTIVE scheme_min
shutdown.exe /r /t 00
pause