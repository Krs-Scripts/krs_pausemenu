function openPauseMenu(data)
    local playerPed = cache.ped
    if not IsEntityDead(playerPed) then
        local bank, cash, job, name = lib.callback.await('krs_pausemenu:getData', false)
      
        SendNUIMessage({
            type = "open",
            bank = bank,
            cash = cash,
            job = job,
            name = name,
        })
        
        SetNuiFocus(true, true)
    end
end

RegisterKeyMapping('+menu', 'open PausaMenu', 'KEYBOARD', 'ESCAPE')

RegisterCommand('+menu', function()
    if not IsPauseMenuActive() then
        openPauseMenu()
        TriggerScreenblurFadeIn(0)
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        DisableControlAction(1, 200, true)
        if IsPauseMenuActive() then
            TriggerScreenblurFadeOut(0)
        end
    end
end)

function closePauseMenu()
    TriggerScreenblurFadeOut(0)
    SetNuiFocus(false, false)
end

function openMainMenu()
    ActivateFrontendMenu("FE_MENU_VERSION_MP_PAUSE", true, -1)
    while not IsPauseMenuActive() do
        Wait(0)
    end
    PauseMenuceptionGoDeeper(0)
    PauseMenuceptionTheKick()
    SetNuiFocus(false, false)
end

function openOptions()
    ActivateFrontendMenu('FE_MENU_VERSION_LANDING_MENU', false, 1)
    SetNuiFocus(false, false)
end

RegisterNUICallback('close', function(data)
    print('close interface')
    closePauseMenu()
end)

RegisterNUICallback('quit', function(data)
    print('exit game')
	TriggerServerEvent("krs_pausemenu:escidalgioco")
    closePauseMenu()
end)

RegisterNUICallback('map', function(data)
    print('map opening')
    openMainMenu()
end)

RegisterNUICallback('opzioni', function(data)
    print('settings opening')
    openOptions()
end)

RegisterNUICallback('discord', function(data)
    print('discord opening')
	SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(0)
end)

RegisterNUICallback('social', function(data)
    print('youtube opening')
	SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(0)
end)
