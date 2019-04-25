# Multiple "Disk Signature Collision Error"-fix

After creating multiple USB sticks with the same image using the highly recommended tool: 
USB Image Tool 1.76  by Alexander Beug  
https://www.alexpage.de/usb-image-tool/download/  

You will be faced with an issue:  
"This disk is offline because it has a signature collision with another disk that is online"   

This can be solved starting ```DiskPart``` from the cmd-prompt (in admin mode):
Assuming your first USB is disk 1, and that no other drive has the ID "12345678":

```select disk 1   
uniqueid disk id=12345678  
exit
```

This will solve the problem - but you will need to manually run these 2 commands for each drive and choose a different number every time.  

Instead you can use the included: ```run.bat``` file by calling ```run ##``` where ## is the number of drives you want to create IDs for.  

NOTE! The script will start from the 2nd drive (DISK 1) and continue until DISK ## - meaning the DISK you entered in your param.  So this only works if  your PC only has 1 drive already installed.  If not you'll need to change the ```random.bat``` which created the DiskPart script.
