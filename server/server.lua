RegisterNetEvent("krs_pausemenu:escidalgioco", function()
    local player = source
    DropPlayer(player, '[Krs Scripts │ \nCiao!')
end)


lib.callback.register('krs_pausemenu:getData', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    local bank = xPlayer.getAccount("bank").money
    local cash = xPlayer.getAccount("money").money
    local job = xPlayer.job.name
    local name = xPlayer.getName()

    return bank, cash, job, name
end)
