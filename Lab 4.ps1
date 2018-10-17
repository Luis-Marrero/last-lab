Set-Location C:\
$num = 5,50,50,3,1
$serverlist = import-csv serverlist.csv
$FileName = read-host Name of the folder?
$FilePath = read-host Path of the folder?
$FileAnswer = read-host 'Are you sure? (Y/N)'
$x = 1

While ($x -eq 1){
    if ($FileAnswer -eq 'Y'){
    New-item -type directory -name $FileName -Path $FilePath
    $Names = import-csv employeelist.csv 
        ForEach ($Name in $Names){
        New-item -type directory -name $Name.Name.Replace(' ','').ToLower() -Path $FilePath\$FileName
        New-item -type file -name hello.txt -Value "Welcome, $($Name.Name)" -Path $FilePath\$FileName\$($Name.Name.Replace(' ','').ToLower())
        }
        $x++
    }
    if ($FileAnswer -eq 'N'){
    $FileName = read-host Name of the folder?
    $FilePath = read-host Path of the folder?
    $FileAnswer = read-host 'Are you sure? (Y/N)'

    }
}
foreach ($number in $num){
$times = read-host "Multiply $number by how much?"
$calc = $number*$times
write-host "$number * $times is $calc"
}


foreach ($server in $serverlist){
    if (Test-Connection -ComputerName $server.Servers.Replace('@{','').Replace('}','') -Quiet){
    write-host $server.Servers.Replace('@{','').Replace('}','') ' is Good'
    }

    else{
    write-host $server.Servers.Replace('@{','').Replace('}','') ' is bad'
    }
}
