Function Set-RemoteDesktopConfig
{Param ([switch]$LowSecurity, [switch]$disable) 
 if ($Disable) {
       set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'`
                        -name "fDenyTSConnections" -Value 1 -erroraction silentlycontinue 
       if (-not $?) {new-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' `
                                      -name "fDenyTSConnections"  -Value 1 -PropertyType dword }
       set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' `
                        -name "UserAuthentication" -Value 1 -erroraction silentlycontinue
      if (-not $?) {new-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1 -PropertyType dword} 
     } 
else {
       set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' `
                        -name "fDenyTSConnections" -Value 0 -erroraction silentlycontinue
        if (-not $?) {new-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' `
                                      -name "fDenyTSConnections" -Value 0 -PropertyType dword } 
       if ($LowSecurity) {
           set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp'`
                                               -name "UserAuthentication" -Value 0 -erroraction silentlycontinue 
        if (-not $?) {new-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp'`
                                          -name "UserAuthentication" -Value 0 -PropertyType dword}
          }

     } 

}

Function Get-RemoteDesktopConfig
{if ((Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server').fDenyTSConnections -eq 1)

          {"Connections not allowed"}

 elseif ((Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp').UserAuthentication -eq 1)
         {"Only Secure Connections allowed"} 

 else     {"All Connections allowed"}

} 

Get-RemoteDesktopConfig
Set-RemoteDesktopConfig -LowSecurity /if you want low security
netsh advfirewall firewall set rule group="Távoli asztal" new enable=yes
netsh advfirewall set allprofiles state off
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
