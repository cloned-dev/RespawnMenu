cfg = {}

cfg.freeze = true -- [Freeze when Menu is Opened]
cfg.close = false -- [When Pressing Back Space it closes menu and unfreezes player]
cfg.marker = true -- [A marker of the location where you can open the menu]

cfg.coords = vector3(341.83953857422,-1397.6486816406,32.509239196777)
 
cfg.options = {
    {name = "St Thomas Hospital", location = vector3(361.84051513672,-593.13464355469,28.664552688599)},
    {name = "Sandy Shores", location = vector3(1839.7781982422,3672.0986328125,34.276706695557)},
    {name = "Paleto Bay", location = vector3(-440.5315246582,6019.291015625,31.490114212036)},
    {name = "Mission Row PD", location = vector3(428.19479370117,-981.58215332031,30.710285186768)},

}

return cfg