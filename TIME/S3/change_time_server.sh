w32tm /config /manualpeerlist:pool.ntp.org /syncfromflags:manual /reliable:yes /update
w32tm /query /status
w32tm /resync
