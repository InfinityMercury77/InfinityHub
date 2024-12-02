local games = {
    [{16732694052}] = 'https://raw.githubusercontent.com/InfinityMercury77/InfinityHub/refs/heads/main/Scripts/Fish.lua'
}

for ids, url in next, games do
    if table.find(ids, game.PlaceId) then
        loadstring(game:HttpGet(url))()
        break
    end
end
