@ECHO OFF
if "%1"=="" GOTO NBRMISSING
Echo OK - Running on %1 drives
call random %1  > random.diskpart
call diskpart /s random.diskpart
GOTO END
:NBRMISSING

Echo Run [nbr_of_USB_drives]
Echo Example: run 7 - Will start at drive 1 and set new unique ID for all drives up to and including drive 7
:END