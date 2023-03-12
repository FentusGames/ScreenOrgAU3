; Configurations
Local $aspect = 16 / 9

Func Config()
	Local $iPID = Run("notepad.exe", "")
	
	Sleep(1000)
	
	Local $hWnd = WinGetHandle("[CLASS:Notepad]")
	if WinExists($hWnd) Then
		WinActivate("[CLASS:Notepad]")
		
		Send("{LWINDOWN}")
		Send("{UP}")
		Sleep(2000)
		Send("{ESC}")
		Send("{LWINUP}")
		
		$wpos = WinGetPos("[CLASS:Notepad]")
		
		$padCurrentX = $wpos[0];
		$padCurrentY = $wpos[1];
		$padCurrentW = $wpos[2] - @DesktopWidth;
		$padCurrentH = $wpos[3] - @DesktopHeight;
		
		Send("{LWINDOWN}")
		Send("{DOWN}")
		Sleep(1000)
		Send("{ESC}")
		Send("{LWINUP}")
		
		Send("{LWINDOWN}")
		Send("{RIGHT}")
		Sleep(1000)
		Send("{ESC}")
		Send("{LWINUP}")
		
		$wpos = WinGetPos("[CLASS:Notepad]")
		
		WinClose("[CLASS:Notepad]")
		
		$currentX = $wpos[0];
		$currentY = $wpos[1];
		$currentW = $wpos[2];
		$currentH = $wpos[3];
		
		Local $width = $currentH * $aspect

		$rightX = @DeskTopWidth - $width + $padCurrentW + $padCurrentX
		$rightY = $currentY
		$rightW = $width
		$rightH = $currentH
		
		$leftX = $padCurrentX
		$leftY = $currentY
		$leftW = @DeskTopWidth - $width + $padCurrentW + $padCurrentX - $padCurrentX + $padCurrentW
		$leftH = $currentH
		
		Local Const $sFilePath = "config.ini"
		
		IniWrite($sFilePath, "CONFIG", "rightX", $rightX)
		IniWrite($sFilePath, "CONFIG", "rightY", $rightY)
		IniWrite($sFilePath, "CONFIG", "rightW", $rightW)
		IniWrite($sFilePath, "CONFIG", "rightH", $rightH)
		
		IniWrite($sFilePath, "CONFIG", "leftX", $leftX)
		IniWrite($sFilePath, "CONFIG", "leftY", $leftY)
		IniWrite($sFilePath, "CONFIG", "leftW", $leftW)
		IniWrite($sFilePath, "CONFIG", "leftH", $leftH)
	EndIf
EndFunc

Config()

