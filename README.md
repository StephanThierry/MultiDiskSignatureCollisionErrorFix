# Multiple "Disk Signature Collision Error"-fix
> How to fix disk signature collision error

After creating multiple USB sticks with the same image using the highly recommended tool: 
USB Image Tool 1.76  by Alexander Beug  
https://www.alexpage.de/usb-image-tool/download/  

You will be faced with an issue:  
"This disk is offline because it has a signature collision with another disk that is online"   

This can be solved starting ```DiskPart``` from the cmd-prompt (in admin mode):
Assuming your first USB is disk 1, and that no other drive has the ID "12345678":

```
select disk 1   
uniqueid disk id=12345678  
exit
```

This will solve the problem - but you will need to manually run these 2 commands for each drive and choose a different number every time.  

Instead you can use the included: ```run.bat``` file by calling ```Run [start_disk] [end_disk]``` where [start_disk] is the fist logical disk and [end_disk] is the last logical disk to apply the change to.  

If you run without parameters you will get a list of all disks connected to the system.

```
Microsoft DiskPart version 10.0.17763.1  
  
Copyright (C) Microsoft Corporation.  
On computer: [PC-NAME]  
  
  Disk ###  Status         Size     Free     Dyn  Gpt  
  --------  -------------  -------  -------  ---  ---  
  Disk 0    Online          465 GB  1024 KB  
  Disk 1    Online          931 GB  1024 KB  
  Disk 2    Offline          29 GB      0 B   
  Disk 3    Online           29 GB      0 B  
  Disk 4    Offline          29 GB      0 B  
  Disk 5    No Media           0 B      0 B  
  Disk 6    No Media           0 B      0 B  
  Disk 7    No Media           0 B      0 B  
  Disk 8    No Media           0 B      0 B  
  Disk 9    Offline          29 GB      0 B  
  Disk 10   Offline          29 GB      0 B  
  Disk 11   Offline          29 GB      0 B  
  Disk 12   Offline          29 GB      0 B  
```

In this overview you can see that the USB's 2-4 and 9-12 are affected by the issue - only Disk 3 is "Online" the rest are "Offline". 
In this case calling `run 2 4` and `run 9 12` will solve the problem.   

Note! You need to disconnect the USB's for Windows to re-read the values. So they will not come online straight after running the command.  