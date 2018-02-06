$net = new-object -ComObject WScript.Network
$net.MapNetworkDrive("u:", "\\192.168.1.1\Projects\Sites", $false, "Sauvegarde", "Sauv1")

$listeDossier =$(Get-ChildItem  -Path "C:\Projects" | ?{ $_.PSIsContainer } )
echo $listeDossier

Set-Alias SZ "C:\Program Files\7-Zip\7z.exe"
foreach ( $dossier in $listeDossier ){
$Source = "C:\Projects\$dossier\*"

$Target = "\\192.168.1.1\Projects\Sites\$dossier"
 SZ a $Target $Source
 echo $dossier
 echo $Source

}