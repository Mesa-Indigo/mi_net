
local resource = GetCurrentResourceName()
local workspace = require 'data.jobs'
local uniform = require 'data.uniform'
local skin = {}

-- set method to check player job before loading blip
-- to prevent excessive blips from showing on map
-- group should be the key in the data.data file

LoadUniform = function(v)
    local model = nil -- get player model m/f on use

    -- find skin changer resource exports

    -- cache player's current outfit

    -- set skin to saved list
end

LoadSkinCache = function()

    -- load player's old skin from skin list

    -- set player skin back from work uniform

    -- empty skin table cache for next time

end

LoadBlip = function(v)
    local blip = nil
    if blip == nil then
        blip = AddBlipForCoord(v.blip.location.x, v.blip.location.y, 0)
        SetBlipSprite(blip, v.blip.sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, v.blip.scale)
        SetBlipColour(blip, v.blip.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.blip.label)
        EndTextCommandSetBlipName(blip)
    end
end

LoadPed = function(v)
    local ped = { obj = nil, spawned = false }
    if not ped.spawned then
        local d1 = v.ped
        local model = lib.requestModel(v.ped.model)
        ped.obj = CreatePed(1, model, d1.spawn.x,
        d1.spawn.y, d1.spawn.z-1, d1.spawn.w, true, false)
        TaskStartScenarioInPlace(ped.obj, d1.scene, 0, true)
        FreezeEntityPosition(ped.obj, true)
        SetBlockingOfNonTemporaryEvents(ped.obj, true)
        SetEntityInvincible(ped.obj, true)
        SetPedCanBeTargetted(ped.obj, false)
        ped.spawned = true
        local options = {
            {
                name = 'task_start',
                label = locale('dlvr_srt'),
                icon = 'fa-solid fa-truck-fast',
                -- groups = workspace['gopostal'].group,
                canInteract = function(_, distance)
                    return distance < 1.5
                end,
                onSelect = function()
                    print(v.blip.label)
                end
            },
            {
                name = 'task_start',
                label = locale('dlvr_end'),
                icon = 'fa-solid fa-xmark',
                -- groups = workspace['gopostal'].group,
                canInteract = function(_, distance)
                    return distance < 1.5
                end,
                onSelect = function()
                    print(v.blip.label)
                end
            }
        }
        Target:addLocalEntity(ped.obj, options)
    end
end


if GetResourceState(resource) == 'started' then
    for k, v in pairs(workspace) do
        if Debug then
            lib.print.info(v.blip.label)
        end
        LoadBlip(v)
        LoadPed(v)
    end
end