#Oscar: Renombrar el sistema
rename-computer master-edu-es-repl

#Oscar: Obtener la configuracion de la interfaz de red
Get-NetIPConfiguration
#Obtener el adaptador de red
Get-NetAdapter

#Oscar: Le ponemos la IP 192.168.1.202 en el adaptador de red 4
New-NetIPAddress -InterfaceIndex 4 -IPaddress 192.168.1.202 -PrefixLength 24 -DefaultGateway 192.168.1.201
#Le configuramos el DNS
Set-DnsClientServerAddress -InterfaceIndex 4 -ServerAddresses 192.168.1.201, 192.168.1.202

#Oscar: Para ver la version del NTFS
fsutil fsinfo ntfsinfo C:\

#Oscar: Ver de que servidor obtiene la hora nuestro windows
W32tm /query /configuration

#Oscar: Establecemos un servidor personalizado del que obtener la hora
w32tm /config /manualpeerlist:"0.es.pool.ntp.org time.google.com" /syncfromflags:manual /update

#Oscar: Comprobar que se han establecido los dos servidores correctamente
W32tm /query /configuration

#Oscar: Comprobar que la fecha se ha establecido correctamente
get-date
