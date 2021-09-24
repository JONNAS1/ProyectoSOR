#Renombrar el sistema
rename-computer master-edu-es-repl

#Obtener la configuracion de la interfaz de red
Get-NetIPConfiguration
#Obtener el adaptador de red
Get-NetAdapter

#Le ponemos la IP 192.168.1.202 en el adaptador de red 4
New-NetIPAddress -InterfaceIndex 4 -IPaddress 192.168.1.202 -PrefixLength 24 -DefaultGateway 192.168.1.201
#Le configuramos el DNS
Set-DnsClientServerAddress -InterfaceIndex 4 -ServerAddresses 192.168.1.201, 192.168.1.202

