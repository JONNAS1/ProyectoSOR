#Oscar: Renombrar el sistema
rename-computer cliente-Windows

#Oscar: Obtener la configuracion de la interfaz de red
Get-NetIPConfiguration
#Obtener el adaptador de red
Get-NetAdapter

#Oscar: Le ponemos la IP 192.168.1.205 en el adaptador de red 4
Get-NetAdapter -Name 'Ethernet' | New-NetIPAddress -IPaddress 192.168.1.205 -PrefixLength 24 -DefaultGateway 192.168.1.201
#Le configuramos el DNS
Get-NetAdapter -Name 'Ethernet' | Set-DnsClientServerAddress -ServerAddresses 192.168.1.201, 192.168.1.202

#Oscar: Quitar la IPv6
Get-NetAdapterBinding -ComponentID ‘ms_tcpip6’ | Disable-NetAdapterBinding -ComponentID ‘ms_tcpip6’ -PassThru

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

#Oscar: Para ver las particiones que ha creado Windows ejecutamso los siguientes comandos
#Oscar: entramos a diskpart
diskpart
#Oscar: Listamos los discos y seleccionamos el deseado
list disk
select disk 0
#Oscar: Para ver la
