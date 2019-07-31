<#  
finds  all *.dmp file  under $basdir  ( recursive) and  runs !analyze  against  each
out  put  goes  to same dir as  dump  as  dumpname.log
usage:  scan-dumps -basedir  "c:\dumps"
#>


function scan-dumps{ param( [string]$basedir)


$dumplist = get-childitem -Recurse $basedir  -Include *.dmp


 
foreach ($dump in $dumplist)
	{
	write-host "processing dump" $dump 
	$command = "kd.exe   -c '!analyze -v;q' -z $dump"
	$out = Invoke-Expression $command
	$out | out-file  -filepath "$dump.log" -Force
   
   
	}
}




