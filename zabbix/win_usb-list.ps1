$json = ""
$result = ""
$atol = ""
$canon = ""
$sceye = ""
$digitalpersona = ""
$yjhf500 = ""
$zdesigner = ""
$cino = ""
$Zebra_CDC = ""

$result = gwmi Win32_USBControllerDevice |%{[wmi]($_.Dependent)} |select name,description,  deviceID, manufacturer  | Select-String -Pattern digitalpersona, zebra, sceye, atol, canon, yjhf500, zdesigner, cino
$atol = $result | Select-String -Pattern atol
$canon = $result | Select-String -Pattern canon
$sceye = $result | Select-String -Pattern sceye
$digitalpersona = $result | Select-String -Pattern digitalpersona
$zdesigner = $result | Select-String -Pattern zdesigner
$cino = $result | Select-String -Pattern cino
$yjhf500 = $result | Select-String -Pattern yjhf500
$Zebra_CDC = $result | Select-String -Pattern zebra


if ($atol -eq $Null) {
$atol_st = 0  
}
else { $atol_st = 1 }

if ($canon -eq $Null) {
$canon_st = 0 
}
else { $canon_st = 1 }

if ($sceye -eq $Null) {
$sceye_st = 0 
}
else { $sceye_st = 1 }

if ($digitalpersona -eq $Null) {
$digitalpersona_st = 0  
}
else { $digitalpersona_st = 1 }

if ($yjhf500 -eq $Null) {
$yjhf500_st = 0  
}
else { $yjhf500_st = 1 }

if ($zdesigner -eq $Null) {    #  ZDesigner GX420d
$zdesigner_st = 0  
}
else { $zdesigner_st = 1 }

if ($cino -eq $Null) {
$cino_st = 0  
}
else { $cino_st = 1 }

if ($Zebra_CDC -eq $Null) {  # Zebra CDC com
$Zebra_CDC_st = 0  
}
else { $Zebra_CDC_st = 1 }

Write-Host "{"
Write-Host " `"data`":["

                $json += "`t {`n " +
                        "`t`t`"{#USB.ATOL}`":`"" + $atol_st + "`"" + ",`n" +
                        "`t`t`"{#USB.ATOLNAME}`":`"" + "ATOL" + "`"" + ",`n" +
                        "`t`t`"{#USB.CANON}`":`"" + $canon_st + "`"" + ",`n" +
                        "`t`t`"{#USB.CANONNAME}`":`"" + "CANON" + "`"" + ",`n" +
                        "`t`t`"{#USB.DIGITALPERSONA}`":`"" + $digitalpersona_st + "`"" + ",`n" +
                        "`t`t`"{#USB.DIGITALPERSONANAME}`":`"" + "DIGITALPERSONA" + "`"" + ",`n" +
						"`t`t`"{#USB.YJHF500}`":`"" + $yjhf500_st + "`"" + ",`n" +
                        "`t`t`"{#USB.YJHF500NAME}`":`"" + "YJHF500" + "`"" + ",`n" +
						"`t`t`"{#USB.ZEBRACDC}`":`"" + $Zebra_CDC_st + "`"" + ",`n" +
                        "`t`t`"{#USB.ZEBRACDCNAME}`":`"" + "ZEBRA" + "`"" + ",`n" +
						"`t`t`"{#USB.ZDESIGNER}`":`"" + $zdesigner_st + "`"" + ",`n" +
                        "`t`t`"{#USB.ZDESIGNERNAME}`":`"" + "ZDESIGNER" + "`"" + ",`n" +
						"`t`t`"{#USB.CINO}`":`"" + $cino_st + "`"" + ",`n" +
                        "`t`t`"{#USB.CINONAME}`":`"" + "CINO" + "`"" + ",`n" +
                        "`t`t`"{#USB.SCEYE}`":`"" + $sceye_st + "`"" + ", `n" +
                        "`t`t`"{#USB.SCEYENAME}`":`"" + "SCEYE" + "`"" + "`n" +
                        "`t }"

Write-Host $json
Write-Host " ]"
Write-Host "}"
