Set-location C:\
New-item -type directory -name fileserver
$Names = import-csv employeelist.csv 
ForEach ($Name in $Names){
New-item -type directory -name $Name.Name.Replace(' ','').ToLower() -Path C:\fileserver
New-item -type file -name hello.txt -Value "Welcome, $($Name.Name)" -Path C:\fileserver\$($Name.Name.Replace(' ','').ToLower())
}
