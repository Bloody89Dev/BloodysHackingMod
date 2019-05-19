CREDITS TO BLOODYMUSTACHE89 AND OBITUS FOR THIS ADDON
Go to lua>autorun>bhm_config.lua to edit spawns and payouts and all that good stuff!

Heres your darkrp code 

// Categories
DarkRP.createCategory{
    name = "Hacking",
    categorises = "jobs",
    startExpanded = true,
    color = Color(173, 171, 171, 255),
    canSee = function(ply) return true end,
    sortOrder = 50
}

DarkRP.createCategory{
    name = "Hacking",
    categorises = "entities",
    startExpanded = true,
    color = Color(173, 171, 171, 255),
    canSee = function(ply) return true end,
    sortOrder = 50
}

// Entities
DarkRP.createEntity("Computer Case", {
    ent = "bhm_computercase",
    model = "models/props/cs_office/computer_caseb_p8.mdl",
    price = 1000,
    max = 2,
    cmd = "buycomputercase",
    category = "Hacking",
    allowed = {TEAM_HACKER}
})

DarkRP.createEntity("Computer Parts", {
    ent = "bhm_computercontents",
    model = "models/props_junk/cardboard_box004a.mdl",
    price = 5000,
    max = 2,
    cmd = "buycomputerparts",
    category = "Hacking",
    allowed = {TEAM_HACKER}
})

DarkRP.createEntity("Computer Vpn", {
    ent = "bhm_vpn",
    model = "models/props_junk/cardboard_box004a.mdl",
    price = 5000,
    max = 2,
    cmd = "buycomputervpn",
    category = "Hacking",
    allowed = {TEAM_HACKER}
})

//Jobs
TEAM_HACKER = DarkRP.createJob("Hacker", {
    color = Color(189, 186, 186, 255),
    model = {"models/player/hostage/hostage_04.mdl"},
    description = [[Buy a hacking computer and start hacking to earn some good money.]],
    weapons = {},
    command = "hacker",
    max = 5,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = true,
    category = "Hacking"
})