param ($param1)
$result = gwmi Win32_USBControllerDevice |%{[wmi]($_.Dependent)} |select name,description,  deviceID, manufacturer  | Select-String -Pattern $param1
$res = $result | Select-String -Pattern $param1
Write-Host $res