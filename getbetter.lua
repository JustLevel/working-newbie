local units = {
    "Quincy King",
    "Lightning Amber",
    "Fear Symbol",
    "Salo[TS]",
    "Yukka",
    "Tobara",
    "Madness Tesra",
    "Reaper Girl Milla",
    "Tamer Suguro",
    "Permeation Hero",
    "Snake Shinigami",
    "Atarante",
    "HolyKnight Almer",
    "Blue Flames",
    "King of Heroes",
    "Sakura Captain",
    "HunterKid",
    "Chaser Dracula",
    "Himo",
    "Blood Queen",
    "Sombra Sister",
    "FalconEye",
    "VoloBlessing2",
    "Pumpkin Witch",
    "VoloBlessing1",
    "Power Reaper",
    "Halloween",
    "Uchigo[Teen]",
    "The World",
    "Cotaro",
    "Tamer Fuko",
    "Uchigo",
    "Brute Captain",
    "Shielder",
    "The Thunderbolt",
    "The Power",
    "Naw",
    "The Glutton",
    "The Explode",
    "Gambling Sorcerer",
    "String Mage",
    "Monako Osho",
    "Vizard Captain[BW]",
    "Visionary",
    "Hoku[100%]",
    "White Reaper",
    "Supersonic Ninja",
    "Denis",
    "Shizaku",
    "NightBladeSamurai",
    "Desert Pirate",
    "Kujaku Demon",
    "Cat Spirit",
    "Silent",
    "Lord Sombra",
    "BizzyWing",
    "Blood Demon",
    "DragonEye",
    "Test2",
    "Arter",
    "Vuno",
    "Gentle-Jo",
    "NewYork-Jo",
    "Grand Reaper",
    "Hoku",
    "HiddenMistDemon",
    "Flame Emperor",
    "SlimeLord",
    "Vizard Captain",
    "KriezerFullPower",
    "Scarlet Knight",
    "Butterfly Pilar Shino",
    "Mist Pillar Mui",
    "Pillarmen Kazel",
    "The Demon Blade",
    "Murasama",
    "Leader",
    "Manala",
    "Darkness Vampire",
    "Killer",
    "God Sopp",
    "Crimson Waifu",
    "Super Star",
    "RedHair",
    "Evil Kai",
    "Ice Shinigami",
    "Veshikun",
    "RedArcher",
    "Shining Star Idol",
    "Flower Magician",
    "Poseidon",
    "King of Knights",
    "Peace Symbol",
    "DarkBeard[Emperor]",
    "Royal Girl",
    "UselessGodessChristmas",
    "Father",
    "BloodWing",
    "ThornPrincess",
    "Dark Flame Lover",
    "DarkHollow",
    "Unlimited",
    "Muda Boy",
    "OneEyeMonster",
    "VirtualSwordman",
    "Test3",
    "Dark Kongkun",
    "Pinky",
    "One Eye Emperor",
    "Magician Red",
    "Umu",
    "Muge",
    "UselessGodess",
    "Gura",
    "Tohru",
    "Barust",
    "VirtualSwordGirl",
    "Yata",
    "Shadow Monarch",
    "Phantoms Fool",
    "Golden Wind",
    "Ice Buster",
    "Pride of Lion",
    "Light Admiral",
    "The Frozen Moon",
    "Third Moon Azaka",
    "Card Fighter Yui",
    "Freedom",
    "Ruffy [Emperor]",
    "Ruffy[TS]",
    "God Shinobi",
    "Uchigo[Dangai]",
    "Berserk Mecha",
    "Frozen Night Queen",
    "Ado",
    "Dark Flower",
    "Maky",
}

local rr = game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("TokenExchange")

for _, un in ipairs(units) do
    local args = {
        [1] = un,
        [2] = 1
    }

    rr:InvokeServer(unpack(args))
    task.wait()
end
