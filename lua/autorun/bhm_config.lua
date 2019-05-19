bhm_config = {}
bhm_config.HackTimeAmount = 300
bhm_config.PayoutAmount = 5000
/* Go in game where you want your npc and open console, run the command getpos, it should come out like this:
setpos 665.057312 -657.638794 -79.968750;setang 19.900129 -42.108894 0.000000
DONT use the numbers i have, it wont work the same.
Take a look at your output of numbers after setpos theres a section of numbers, called your position after your position theres a set of numbers, called your angle
Put your position into bhm_config.npcData in one of the Vector slots, it should look something like this:
pos = Vector ( 1006.578125, -123.593025, -79.968750 )
Now put your angle in bhm_config.npcAng, it sould look something like this:
ang = Angle ( 0, 180, 0 )
DONT FORGET TO PUT YOUR COMMAS
ADD AND REMOVE AS MANY VECTORS AS YOU WANT OR NEED
*/
// Add as many npc slots as you need! Note: It works best if you only change the middle angle. The middle is responsible for where the npc is facing, also it works best to round the number like you see in the examples!
bhm_config.npcData = {
  // Example { pos = Vector ( 1006.578125, -123.593025, -79.968750 ), ang = Angle ( 0, 180, 0 ) },
  //{ pos = Vector (...), ang = Angle (...) },
  //{ pos = Vector (...), ang = Angle (...) },
}