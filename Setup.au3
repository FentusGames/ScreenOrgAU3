Local Const $sFilePath = "config.ini"

Local $rightX = IniRead($sFilePath, "CONFIG", "rightX", 0)
Local $rightY = IniRead($sFilePath, "CONFIG", "rightY", 0)
Local $rightW = IniRead($sFilePath, "CONFIG", "rightW", 0)
Local $rightH = IniRead($sFilePath, "CONFIG", "rightH", 0)

Local $leftX = IniRead($sFilePath, "CONFIG", "leftX", 0)
Local $leftY = IniRead($sFilePath, "CONFIG", "leftY", 0)
Local $leftW = IniRead($sFilePath, "CONFIG", "leftW", 0)
Local $leftH = IniRead($sFilePath, "CONFIG", "leftH", 0)

Func Move($leftClass, $rightClass)
	Local $hWndLeft = WinGetHandle($leftClass)
	Local $hWndRight = WinGetHandle($rightClass)
	
	If WinExists($hWndLeft) And WinExists($hWndRight) Then
		WinMove($hWndLeft, "", $leftX, $leftY, $leftW, $leftH)
		WinMove($hWndRight, "", $rightX, $rightY, $rightW, $rightH)
	EndIf
EndFunc

Move("[CLASS:SciTEWindow]", "[CLASS:UnityWndClass]")