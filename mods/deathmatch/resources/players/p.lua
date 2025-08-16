addEventHandler('onPlayerJoin', root, function()


	local db = exports.database:GetConnection()
	local x, y, z = getElementPosition(source)
	local name = getPlayerName(source)
	local skin = getElementModel(source)

	query = dbQuery(db, "SELECT * FROM `users` WHERE `name` = (?)", name)
	result = dbPoll(query, -1)

	if result and #result > 0 then
		if result[1].x and result[1].y and result[1].z then
		spawnPlayer(source, result[1].x,result[1].y,result[1].z)
		end
		outputChatBox("Welcome Back", source)
		fadeCamera(source, true)
		setCameraTarget(source, source)
	else
		local db = exports.database:GetConnection()
		local x, y, z = getElementPosition(source)
		local name = getPlayerName(source)
		local skin = getElementModel(source)

		dbExec(db, "INSERT INTO users (name, skin, x, y, z) VALUES (?, ?, ?, ?, ?)", name, skin, x, y, z)

		spawnPlayer(source, 1948.875, -1713.143, 13.547)
		fadeCamera(source, true)
		setCameraTarget(source, source)
		outputChatBox("Welcome", source, 255,255,0)
	end



end)

addEventHandler('onPlayerQuit', root, function()

	local db = exports.database:GetConnection()
	local x, y, z = getElementPosition(source)
	local name = getPlayerName(source)
	local skin = getElementModel(source)
	dbExec(db, "UPDATE users SET x = ?, y = ?, z = ? WHERE name = ?", x, y, z, name)
end)

outputDebugString("Successfully loaded p.lua1")

--local spawnX, spawnY, spawnZ = 1948.875, -1713.143, 13.547
--function joinHandler()
	--spawnPlayer(source, spawnX, spawnY, spawnZ)
	--fadeCamera(source, true)
	--setCameraTarget(source, source)
	--outputChatBox("Welcome to My Server", source)
--end
--addEventHandler("onPlayerJoin", getRootElement(), joinHandler)