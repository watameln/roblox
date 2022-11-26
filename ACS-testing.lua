--imports
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/bleklib/main/library.lua"))()
local cfg = require(game:GetService("ReplicatedStorage")["ACS_Engine"].ServerConfigs.Config)

--var
local spd = false
local bhop = false
local no_falldamage = false
local plr = game.Players.LocalPlayer
local Evt = game.ReplicatedStorage.ACS_Engine.Eventos
local cce = Instance.new("ColorCorrectionEffect", game.Workspace.CurrentCamera)
local nvg = false
local s = Instance.new("PointLight", game.Players.LocalPlayer.Character.Head)
s.Enabled = false
s.Brightness = 1
s.Range = 100
cce.Enabled = false
cce.TintColor = Color3.new(0.121568, 0.403921, 0.078431)
cce.Brightness = 2
cce.Contrast = 2.5


--functions
function getgun(name)
    local args = {
        [1] = name
    }

    game:GetService("ReplicatedStorage").InvVal:InvokeServer(unpack(args))
end

--window
local win = ui:Create({
    Name = "ACS gun testing",
    StartupSound = {
        Toggle = false,
        SoundID = "rbxassetid://6958727243",
        TimePosition = 1
    }
})

--self
local slf = win:Tab('Self')
slf:Toggle('Super speed', function()
    spd = not spd
    if spd == true then
        cfg.RunWalkSpeed = 200
        else
            cfg.RunWalkSpeed = 30
    end
end)

slf:Toggle('Bunny hop', function()
    bhop = not bhop
    if bhop == true then
        cfg.AntiBunnyHop = false
    else
        cfg.AntiBunnyHop = true
    end
end)

slf:Toggle('Disable fall damage', function()
    no_falldamage = not no_falldamage
    if no_falldamage == true then
        cfg.EnableFallDamage = false
    else
        cfg.EnableFallDamage = true
    end
end)

slf:Toggle('NVG', function()
    nvg = not nvg
    if nvg == true then
        cce.Enabled = true
        s.Enabled = true
    else
        cce.Enabled = false
        s.Enabled = false
    end
end)



--weapon giver
local wpn = win:Tab('Unlock tool')
wpn:Button("Bloody Mary", function()
    getgun("Bloody Mary")
end)
wpn:Button("H.T.G.", function()
    getgun("H.T.G.")
end)
wpn:Button("Flashbang", function()
    getgun("Flashbang")
end)
wpn:Button("Imposters Revenge", function()
    getgun("Imposters Revenge")
end)
wpn:Button("M60", function()
    getgun("M60")
end)
wpn:Button("M9", function()
   getgun("M9")
end)
wpn:Button("Mod AK12", function()
    getgun("Mod AK12")
end)
wpn:Button("Mod G3A3", function()
    getgun("Mod G3A3")
end)
wpn:Button("Purple Void", function()
    getgun("Purple Void")
end)


--credits
local cdt = win:Tab('Credit')
cdt:Label('Made by Frostfuno -  Co-owner watameln was here >:3')
