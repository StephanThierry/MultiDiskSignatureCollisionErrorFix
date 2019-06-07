@ECHO OFF
if "%1"=="" GOTO NBRMISSING
if "%2"=="" GOTO NBRMISSING
Echo OK - Running on DRIVES %1 to %2 drives
call random %1 %2 > random.diskpart
call diskpart /s random.diskpart
GOTO END
:NBRMISSING

Echo Run [start_disk] [end_disk]
Echo Example: run 1 7 - Will start at drive 1 and set new unique ID for all drives up to and including drive 7
Echo Example: run 4 4 - Will start and end at drive 4, running only on that drive
Echo.
call DiskPart /s listdisk
:END