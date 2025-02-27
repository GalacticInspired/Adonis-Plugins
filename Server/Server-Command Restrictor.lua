server = nil
return function()
	--// This plugin will whitelist certain commands for use, and set the rest as creators only
	--// Command indexes to not restrict go into the whitelist table below
	--// If the value is false, it will use the command's original AdminLevel
	--// If the value is set to a string it will use that as the new AdminLevel
	--// Any commands not in the below table will be set as Creators only
	--// You should be able to use either the command index or one of the command's "Commands" strings

	local commands = { --// Command string or index
		Shutdown = "Owners";
		Invisible = "Owners";
		Respawn = "Admins";
		Visible = "Owners";
		Shirt = "Owners";
		Pants = "Owners";
		Kick = "Moderators";
		Ban = "Admins";
		View = "Moderators";
		chat = "Admins";
		unchat = "Admins";
		N = "Admins";
		Clean = "Moderators";
		Jump = "Moderators";
		Tban = "Admins";
		Mpm = "Moderators";
		Admins = "Moderators"; 
		Untimeban = "Admins";
		Team = "Moderators";
		Joinlogs = "Moderators";
		Pnum = "Moderators";
		notepad = "Moderators";
		Note = "Moderators";
		Hcountdown = "Admins";
		Stopcountdown = "Admins";
		Bring = "Moderators";
		mutelist = "Moderators";
		Refresh = "Moderators";
		m = "Admins";
		Setmessage = "Admins";
		To = "Moderators";
		gear = "Admins";
		notes = "Moderators";
		removenotes = "Moderators";
		countdown = "Admins";
		view = "Moderators";
		players = "Moderators";
		flynoclip = "Admins";
		notify = "Admins";
		details = "Moderators";
		gameban = "Admins";
		clip = "Admins";
		bchat = "Admins";
		unname = "Admins";
		kill = "Admins";
		track = "Moderators";
		logs = "Moderators";
		mute = "Moderators";
		ungameban = "Admins";
		respawn = "Moderators";
		chatlogs = "Moderators";
		info = "Moderators";
		showlogs = "Moderators";
		clear = "Moderators";
		tp = "Moderators";
		quote = "Moderators";
		to = "Moderators";
		noclip = "Admins";
		fly = "Admins"; 
		unfly = "Admins";
		cmds = "Moderators";
		exploitlogs = "Moderators";
		cmdbox = "Moderators";
		kick = "Moderators";
		ban = "Admins";
		name = "Admins";
		Chatnotify = "Moderators";
		warnings = "Moderators";
		timebanlist = "Moderators";
		banlist = "Moderators";
	}


	local whitelist = {} --// Add ONLY the command indecies to this (if you need to target a specific index)

	local function getIndex(str)
		for index,cmd in next,server.Commands do
			for i,c in next,cmd.Commands do
				if c:lower() == str:lower() then
					return index
				end
			end
		end
	end

	for i,v in next,commands do
		local found = (server.Commands[i] and i) or getIndex(i)
		
		if found then
			whitelist[found] = v
		end
	end

	for index,com in next,server.Commands do
		local newLevel = whitelist[index];
		if whitelist[index] ~= nil then
			com.AdminLevel = ((type(newLevel) == "string" or type(newLevel) == "number" or type(newLevel) == "table") and newLevel) or com.AdminLevel
		else
			com.AdminLevel = 900
		end
	end
end
