isBcoordsOn = false
waitTime = 50


RegisterCommand("bcoords", function(_, args)
    isBcoordsOn = not isBcoordsOn
    SendNUIMessage({ action = "toggle_bcoords", isBcoordsOn = isBcoordsOn })

    if isBcoordsOn then
        CreateThread(function()
            while isBcoordsOn do
                local Ped = PlayerPedId()
                local PedCoords = GetEntityCoords(Ped)
                local PedHeading = GetEntityHeading(Ped)
                local uiCoords = { x = PedCoords.x, y = PedCoords.y, z = PedCoords.z, h = PedHeading }
                SendNUIMessage({ action = "ped_coords", PedCoords = uiCoords })
                if IsControlPressed(0, 21) then
                    local timer = 0
                    while timer < waitTime do
                        Citizen.Wait(0)
                        timer = timer + 1
                        if IsControlJustPressed(0, 26) then
                            local Ped = PlayerPedId()
                            local PedCoords = GetEntityCoords(Ped)
                            local PedHeading = GetEntityHeading(Ped)
                            print(PedHeading)
                            local coordsV = { x = PedCoords.x, y = PedCoords.y, z = PedCoords.z, h = PedHeading }
                            SendNUIMessage({ action = "copy", coords = coordsV })
                        elseif IsControlJustPressed(0, 32) then
                            SendNUIMessage({ action = "toggle_bcoords", isBcoordsOn = isBcoordsOn })
                            isBcoordsOn = not isBcoordsOn
                        end
                    end
                end

                Wait(5)
            end
        end)
    end
end)
