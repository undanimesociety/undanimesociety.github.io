$client = new-object System.Net.WebClient;

$semester = Read-Host "enter semester";
$anime1 = Read-Host "enter anime1";
$anime2 = Read-Host "enter anime2";
$anime3 = Read-Host "enter anime3";
$anime4 = Read-Host "enter anime4";

echo '';
Write-Progress -Activity "Reformatting Input" -PercentComplete 0;
$anime1 = $anime1 -replace '  ','' -replace '^ ','' -replace ' $','' -replace ' ', '+'; Write-Progress -Activity "Reformatting Input" -PercentComplete 25;
$anime2 = $anime2 -replace '  ','' -replace '^ ','' -replace ' $','' -replace ' ', '+'; Write-Progress -Activity "Reformatting Input" -PercentComplete 50;
$anime3 = $anime3 -replace '  ','' -replace '^ ','' -replace ' $','' -replace ' ', '+'; Write-Progress -Activity "Reformatting Input" -PercentComplete 75;
$anime4 = $anime4 -replace '  ','' -replace '^ ','' -replace ' $','' -replace ' ', '+'; Write-Progress -Activity "Reformatting Input" -PercentComplete 100;
echo "Reformatted Input";
Write-Progress -Activity "Receiving Results" -PercentComplete 0;
$out1 = $client.DownloadString('https://www.animenewsnetwork.com/encyclopedia/search/name?q='+$anime1) -split '\r?\n' | Select-String -Pattern "anime <" | Select-String -Pattern "(TV)" | Select-Object -first 1; Write-Progress -Activity "Receiving Results" -PercentComplete 25;
$out2 = $client.DownloadString('https://www.animenewsnetwork.com/encyclopedia/search/name?q='+$anime2) -split '\r?\n' | Select-String -Pattern "anime <" | Select-String -Pattern "(TV)" | Select-Object -first 1; Write-Progress -Activity "Receiving Results" -PercentComplete 50;
$out3 = $client.DownloadString('https://www.animenewsnetwork.com/encyclopedia/search/name?q='+$anime3) -split '\r?\n' | Select-String -Pattern "anime <" | Select-String -Pattern "(TV)" | Select-Object -first 1; Write-Progress -Activity "Receiving Results" -PercentComplete 75;
$out4 = $client.DownloadString('https://www.animenewsnetwork.com/encyclopedia/search/name?q='+$anime4) -split '\r?\n' | Select-String -Pattern "anime <" | Select-String -Pattern "(TV)" | Select-Object -first 1; Write-Progress -Activity "Receiving Results" -PercentComplete 100;
echo "Received Results";
$id1 = $out1 -replace '.*id=([0-9]+)".*','$1';
$id2 = $out2 -replace '.*id=([0-9]+)".*','$1';
$id3 = $out3 -replace '.*id=([0-9]+)".*','$1';
$id4 = $out4 -replace '.*id=([0-9]+)".*','$1';
echo "Filtered IDs";
$name1 = $out1 -replace '.*[0-9]+">(.*)<i>.*','$1' -replace '</?b>','';
$name2 = $out2 -replace '.*[0-9]+">(.*)<i>.*','$1' -replace '</?b>','';
$name3 = $out3 -replace '.*[0-9]+">(.*)<i>.*','$1' -replace '</?b>','';
$name4 = $out4 -replace '.*[0-9]+">(.*)<i>.*','$1' -replace '</?b>','';

if (($semester -cne "Fall") -and ($semester -cne "Spring")){
	if((Get-Date -Format 'MM') -gt "07"){
		$semester = "Fall";
	}else{
		$semester = "Spring";
	}
}
echo '';
echo "$(Get-Date -Format 'yyyy'),$semester,$id1,$name1,$id2,$name2,$id3,$name3,$id4,$name4";
echo '';
pause;