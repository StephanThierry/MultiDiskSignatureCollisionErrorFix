@ECHO OFF
if "%1"=="" GOTO NBRMISSING
if "%2"=="" GOTO NBRMISSING
Echo OK - Running on DRIVES %1 to %2 drives
call random %1 %2 > random.diskpart
call diskpart /s random.diskpart
GOTO END
:NBRMISSING

Echo Run [nbr_of_USB_drives]
Echo Example: run 1 7 - Will start at drive 1 and set new unique ID for all drives up to and including drive 7
Echo.
call DiskPart /s listdisk
:END