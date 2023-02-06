Citizen.CreateThread(function()
    local hat = 0
    local texture = 0
    local timer = 0
		local me = PlayerPedId()
    while true do
        Wait(1000)
				me = PlayerPedId()
        if not IsPedInAnyVehicle(me,true) then
            hat = GetPedPropIndex(me,0)
            texture = GetPedPropTextureIndex(me,0)
        else
            timer = GetGameTimer()
            while not IsPedInAnyVehicle(me,false) or timer + 2000 < GetGameTimer() do
                Wait(0)
            end
            if IsPedInAnyVehicle(me,false) then
                SetPedPropIndex(me,0, hat, texture, 0)
                while IsPedInAnyVehicle(me,false) do
                    Wait(1000)
                end
            end
        end
    end
end)