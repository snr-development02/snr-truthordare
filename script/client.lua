-- SNR STORE | https://discord.gg/TtHFpf3enK

RegisterNetEvent("snr-cevirsise", function()
  local ped = PlayerPedId()
  local kordinat = GetEntityCoords(ped)
  local number = math.random(1000 ,5000)
    TriggerServerEvent("dogruluk-cesaret:server:rotate", kordinat.x,kordinat.y,kordinat.z,number)
end)

RegisterNetEvent("dogruluk-cesaret:client:rotate", function(x,y,z,number)
    local sise = CreateObject(GetHashKey('prop_bottle_macbeth'),x,y,z, false, false, true)
    local rot = vector3(x,y - 100 ,z)
    local kordinat = GetEntityCoords(sise)
    FreezeEntityPosition(sise,true)
    SetEntityRotation(sise, rot, false, true)
    PlaceObjectOnGroundProperly(sise)
    SetModelAsNoLongerNeeded(sise)
      for i=1,number do
          max = i 
          rot3 = vector3(rot.x, rot.y, max)
          Wait(1)
          SetEntityRotation(sise, rot3, false, true)
        end
      Citizen.Wait(10000)
      DeleteEntity(sise)
end)