RegisterCommand('tappiviri', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local vehicle = GetVehiclePedIsIn(ped, false)
        
        SetVehicleModKit(vehicle, 0)
        Wait(100)
        
        local engineMod = GetNumVehicleMods(vehicle, 11)
        local brakeMod = GetNumVehicleMods(vehicle, 12)
        local transmissionMod = GetNumVehicleMods(vehicle, 13)
        local suspensionMod = GetNumVehicleMods(vehicle, 15)
        
        if engineMod > 0 then
            SetVehicleMod(vehicle, 11, math.min(4, engineMod - 1), false)
        end
        
        if brakeMod > 0 then
            SetVehicleMod(vehicle, 12, math.min(3, brakeMod - 1), false)
        end
        
        if transmissionMod > 0 then
            SetVehicleMod(vehicle, 13, math.min(3, transmissionMod - 1), false)
        end
        
        if suspensionMod > 0 then
            SetVehicleMod(vehicle, 15, math.min(3, suspensionMod - 1), false)
        end
        
        ToggleVehicleMod(vehicle, 18, true)
        
        SetVehicleFixed(vehicle)
        SetVehicleDeformationFixed(vehicle)
        SetVehicleUndriveable(vehicle, false)
        SetVehicleEngineHealth(vehicle, 1000.0)
        SetVehicleBodyHealth(vehicle, 1000.0)
        SetVehiclePetrolTankHealth(vehicle, 1000.0)
        
        lib.notify({
            title = 'Ilmoitus',
            description = 'Tappivirit pistetty!',
            type = 'success'
        })
    else
        lib.notify({
            title = 'Virhe',
            description = 'Et oo autos!',
            type = 'error'
        })
    end
end, false)