local Version = 2.01
local FileName = GetCurrentEnv().FILE_NAME
local Debug = false

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

local Keys2={}

Keys2[8]='Back'
Keys2[9]='Tab'
Keys2[13]='Enter'
Keys2[16]='Shift'
Keys2[17]='Ctrl'
Keys2[18]='Alt'
Keys2[19]='Pause'
Keys2[20]='Capslock'
Keys2[21]='KanaMode'
Keys2[23]='JunjaMode'
Keys2[24]='FinalMode'
Keys2[25]='HanjaMode'
Keys2[27]='Esc'
Keys2[28]='IMEConvert'
Keys2[29]='IMENonconvert'
Keys2[30]='IMEAceept'
Keys2[31]='IMEModeChange'
Keys2[32]='Space'
Keys2[33]='PageUp'
Keys2[34]='PageDown'
Keys2[35]='End'
Keys2[36]='Home'
Keys2[37]='Left'
Keys2[38]='Up'
Keys2[39]='Right'
Keys2[40]='Down'
Keys2[44]='PrintScreen'
Keys2[45]='Insert'
Keys2[46]='Delete'
Keys2[48]='0'
Keys2[49]='1'
Keys2[50]='2'
Keys2[51]='3'
Keys2[52]='4'
Keys2[53]='5'
Keys2[54]='6'
Keys2[55]='7'
Keys2[56]='8'
Keys2[57]='9'
Keys2[65]='A'
Keys2[66]='B'
Keys2[67]='C'
Keys2[68]='D'
Keys2[69]='E'
Keys2[70]='F'
Keys2[71]='G'
Keys2[72]='H'
Keys2[73]='I'
Keys2[74]='J'
Keys2[75]='K'
Keys2[76]='L'
Keys2[77]='M'
Keys2[78]='N'
Keys2[79]='O'
Keys2[80]='P'
Keys2[81]='Q'
Keys2[82]='R'
Keys2[83]='S'
Keys2[84]='T'
Keys2[85]='U'
Keys2[86]='V'
Keys2[87]='W'
Keys2[88]='X'
Keys2[89]='Y'
Keys2[90]='Z'
Keys2[91]='LWin'
Keys2[92]='RWin'
Keys2[93]='Apps'
Keys2[96]='NumPad0'
Keys2[97]='NumPad1'
Keys2[98]='NumPad2'
Keys2[99]='NumPad3'
Keys2[100]='NumPad4'
Keys2[101]='NumPad5'
Keys2[102]='NumPad6'
Keys2[103]='NumPad7'
Keys2[104]='NumPad8'
Keys2[105]='NumPad9'
Keys2[106]='Multiply'
Keys2[107]='Add'
Keys2[108]='Separator'
Keys2[109]='Subtract'
Keys2[110]='Decimal'
Keys2[111]='Divide'
Keys2[112]='F1'
Keys2[113]='F2'
Keys2[114]='F3'
Keys2[115]='F4'
Keys2[116]='F5'
Keys2[117]='F6'
Keys2[118]='F7'
Keys2[119]='F8'
Keys2[120]='F9'
Keys2[121]='F10'
Keys2[122]='F11'
Keys2[123]='F12'
Keys2[144]='NumLock'
Keys2[145]='ScrollLock'
Keys2[186]=';'
Keys2[187]='='
Keys2[188]=','
Keys2[189]='-'
Keys2[190]='.'
Keys2[191]='/'
Keys2[192]='Oemtilde'
Keys2[219]='OemOpenBrackets'
Keys2[220]='Oem5'
Keys2[221]='Oem6'
Keys2[222]="'"

org_txtKey= _G.scriptConfig._txtKey

_G.scriptConfig._txtKey =
function(self,key)
	return Keys2[key]
end

---------------------------------------------------------------------------------

if myHero.charName ~= "Blitzcrank" then
	return
elseif GetUser() == "Proto" then
	print(os.date() .. ': Proto(dimokdimka@gmail.com) is blocked\n')
	return
elseif GetUser() == "Dragon900" then
	print(os.date() .. ': Dragon900(atitunes1@gmail.com) is blocked\n')
	return
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

local FuckIndex = 1
local LastFuck = os.clock()
local Fucker = {
"                                       H",
"                                      Hi",
"                                     Hi ",
"                                    Hi g",
"                                   Hi gu",
"                                  Hi guy",
"                                 Hi guy ",
"                                Hi guy I",
"                               Hi guy I'",
"                              Hi guy I'm",
"                             Hi guy I'm ",
"                            Hi guy I'm H",
"                           Hi guy I'm HT",
"                          Hi guy I'm HTT",
"                         Hi guy I'm HTTF",
"                        Hi guy I'm HTTF ",
"                       Hi guy I'm HTTF =",
"                      Hi guy I'm HTTF =)",
"                     Hi guy I'm HTTF =) ",
"                    Hi guy I'm HTTF =) S",
"                   Hi guy I'm HTTF =) Su",
"                  Hi guy I'm HTTF =) Suc",
"                 Hi guy I'm HTTF =) Suck",
"                Hi guy I'm HTTF =) Suck ",
"               Hi guy I'm HTTF =) Suck m",
"              Hi guy I'm HTTF =) Suck my",
"             Hi guy I'm HTTF =) Suck my ",
"            Hi guy I'm HTTF =) Suck my b",
"           Hi guy I'm HTTF =) Suck my ba",
"          Hi guy I'm HTTF =) Suck my bal",
"         Hi guy I'm HTTF =) Suck my ball",
"        Hi guy I'm HTTF =) Suck my balls",
"       Hi guy I'm HTTF =) Suck my balls,",
"      Hi guy I'm HTTF =) Suck my balls, ",
"     Hi guy I'm HTTF =) Suck my balls, f",
"    Hi guy I'm HTTF =) Suck my balls, fu",
"   Hi guy I'm HTTF =) Suck my balls, fuc",
"  Hi guy I'm HTTF =) Suck my balls, fuck",
" Hi guy I'm HTTF =) Suck my balls, fucke",
"Hi guy I'm HTTF =) Suck my balls, fucker",
"i guy I'm HTTF =) Suck my balls, fucker",
" guy I'm HTTF =) Suck my balls, fucker",
"guy I'm HTTF =) Suck my balls, fucker",
"uy I'm HTTF =) Suck my balls, fucker",
"y I'm HTTF =) Suck my balls, fucker",
" I'm HTTF =) Suck my balls, fucker",
"I'm HTTF =) Suck my balls, fucker",
"'m HTTF =) Suck my balls, fucker",
"m HTTF =) Suck my balls, fucker",
" HTTF =) Suck my balls, fucker",
"HTTF =) Suck my balls, fucker",
"TTF =) Suck my balls, fucker",
"TF =) Suck my balls, fucker",
"F =) Suck my balls, fucker",
" =) Suck my balls, fucker",
"=) Suck my balls, fucker",
") Suck my balls, fucker",
" Suck my balls, fucker",
"Suck my balls, fucker",
"uck my balls, fucker",
"ck my balls, fucker",
"k my balls, fucker",
" my balls, fucker",
"my balls, fucker",
"y balls, fucker",
" balls, fucker",
"balls, fucker",
"alls, fucker",
"lls, fucker",
"ls, fucker",
"s, fucker",
", fucker",
" fucker",
"fucker",
"ucker",
"cker",
"ker",
"er",
"r",
"\n"
}

function FuckTick()

	if os.clock() > LastFuck+0.05 then
		LastFuck = os.clock()
		print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" .. Fucker[FuckIndex])

		if FuckIndex == #Fucker then
			FuckIndex = 1
			return
		end

		FuckIndex = FuckIndex+1
	end

end

if debug.getinfo(_G.GetUser).what == "Lua" or debug.getinfo(GetUser).what == "Lua" then
	AddTickCallback(function() FuckTick() end)
	return
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

class("ScriptUpdate")
class("HTTF_Blitzcrank")

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:ScriptMsg(msg)
	print("<font color=\"#DAA520\"><b>[HTTF Blitzcrank]</b></font>  <font color=\"#FFFFFF\">" .. msg .. "</font>")
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:ErrorMsg(msg)
	print("<font color=\"#DAA520\"><b>[HTTF Blitzcrank]</b></font>  <font color=\"#FF0000\">" .. msg .. "</font>")
end

---------------------------------------------------------------------------------

function ScriptUpdate:__init(LocalVersion, UseHttps, Host, VersionPath, ScriptPath, SavePath, CallbackUpdate, CallbackNoUpdate, CallbackNewVersion,CallbackError)
	self.LocalVersion = LocalVersion
	self.Host = Host
	self.VersionPath = '/BoL/TCPUpdater/GetScript' .. (UseHttps and '5' or '6') .. '.php?script=' .. self:Base64Encode(self.Host .. VersionPath) .. '&rand=' .. math.random(99999999)
	self.ScriptPath = '/BoL/TCPUpdater/GetScript' .. (UseHttps and '5' or '6') .. '.php?script=' .. self:Base64Encode(self.Host .. ScriptPath) .. '&rand=' .. math.random(99999999)
	self.SavePath = SavePath
	self.CallbackUpdate = CallbackUpdate
	self.CallbackNoUpdate = CallbackNoUpdate
	self.CallbackNewVersion = CallbackNewVersion
	self.CallbackError = CallbackError
	AddDrawCallback(function() self:OnDraw() end)
	self:CreateSocket(self.VersionPath)
	self.DownloadStatus = 'Connect to Server for VersionInfo'
	AddTickCallback(function() self:GetOnlineVersion() end)
end

function ScriptUpdate:print(str)
	print('<font color="#FFFFFF">' .. os.clock() .. ': ' .. str)
end

function ScriptUpdate:OnDraw()

	if self.DownloadStatus ~= 'Downloading Script (100%)' and self.DownloadStatus ~= 'Downloading VersionInfo (100%)' then
		DrawText('Download Status: ' .. (self.DownloadStatus or 'Unknown'),50,10,50,ARGB(0xFF,0xFF,0xFF,0xFF))
	end

end

function ScriptUpdate:CreateSocket(url)

	if not self.LuaSocket then
		self.LuaSocket = require("socket")
	else
		self.Socket:close()
		self.Socket = nil
		self.Size = nil
		self.RecvStarted = false
	end

	self.LuaSocket = require("socket")
	self.Socket = self.LuaSocket.tcp()
	self.Socket:settimeout(0, 'b')
	self.Socket:settimeout(99999999, 't')
	self.Socket:connect('sx-bol.eu', 80)
	self.Url = url
	self.Started = false
	self.LastPrint = ""
	self.File = ""
end

function ScriptUpdate:Base64Encode(data)

	local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

	return ((data:gsub('.', function(x)

		local r,b='',x:byte()

		for i = 8,1,-1 do
			r=r .. (b%2^i-b%2^(i-1)>0 and '1' or '0')
		end

		return r;
	end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(x)

		if (#x < 6) then
			return ''
		end

		local c=0

		for i = 1,6 do
			c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0)
		end

		return b:sub(c+1,c+1)
	end) .. ({ '', '==', '=' })[#data%3+1])

end

function ScriptUpdate:GetOnlineVersion()

	if self.GotScriptVersion then
		return
	end

	self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)

	if self.Status == 'timeout' and not self.Started then
		self.Started = true
		self.Socket:send("GET " .. self.Url .. " HTTP/1.1\r\nHost: sx-bol.eu\r\n\r\n")
	end

	if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
		self.RecvStarted = true
		self.DownloadStatus = 'Downloading VersionInfo (0%)'
	end

	self.File = self.File .. (self.Receive or self.Snipped)

	if self.File:find('</s' .. 'ize>') then

		if not self.Size then
			self.Size = tonumber(self.File:sub(self.File:find('<si' .. 'ze>')+6, self.File:find('</si' .. 'ze>')-1))
		end

		if self.File:find('<scr' .. 'ipt>') then

			local _, ScriptFind = self.File:find('<scr' .. 'ipt>')
			local ScriptEnd = self.File:find('</scr' .. 'ipt>')

			if ScriptEnd then
				ScriptEnd = ScriptEnd-1
			end

			local DownloadedSize = self.File:sub(ScriptFind+1, ScriptEnd or -1):len()

			self.DownloadStatus = 'Downloading VersionInfo (' .. math.round(100/self.Size*DownloadedSize,2) .. '%)'
		end

	end

	if self.File:find('</scr' .. 'ipt>') then
		self.DownloadStatus = 'Downloading VersionInfo (100%)'

		local a,b = self.File:find('\r\n\r\n')

		self.File = self.File:sub(a,-1)
		self.NewFile = ''

		for line,content in ipairs(self.File:split('\n')) do

			if content:len() > 5 then
				self.NewFile = self.NewFile .. content
			end

		end

		local HeaderEnd, ContentStart = self.File:find('<scr' .. 'ipt>')
		local ContentEnd, _ = self.File:find('</sc' .. 'ript>')

		if not (ContentStart and ContentEnd) then

			if self.CallbackError and type(self.CallbackError) == 'function' then
				self.CallbackError()
			end

		else
			self.OnlineVersion = (Base64Decode(self.File:sub(ContentStart+1,ContentEnd-1)))
			self.OnlineVersion = tonumber(self.OnlineVersion)

			if self.OnlineVersion > self.LocalVersion then

				if self.CallbackNewVersion and type(self.CallbackNewVersion) == 'function' then
					self.CallbackNewVersion(self.OnlineVersion, self.LocalVersion)
				end

				self:CreateSocket(self.ScriptPath)
				self.DownloadStatus = 'Connect to Server for ScriptDownload'
				AddTickCallback(function() self:DownloadUpdate() end)
			else

				if self.CallbackNoUpdate and type(self.CallbackNoUpdate) == 'function' then
					self.CallbackNoUpdate(self.LocalVersion)
				end

			end

		end

		self.GotScriptVersion = true
	end

end

function ScriptUpdate:DownloadUpdate()

	if self.GotScriptUpdate then
		return
	end

	self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)

	if self.Status == 'timeout' and not self.Started then
		self.Started = true
		self.Socket:send("GET " .. self.Url .. " HTTP/1.1\r\nHost: sx-bol.eu\r\n\r\n")
	end

	if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
		self.RecvStarted = true
		self.DownloadStatus = 'Downloading Script (0%)'
	end

	self.File = self.File .. (self.Receive or self.Snipped)

	if self.File:find('</si' .. 'ze>') then

		if not self.Size then
			self.Size = tonumber(self.File:sub(self.File:find('<si' .. 'ze>')+6, self.File:find('</si' .. 'ze>')-1))
		end

		if self.File:find('<scr' .. 'ipt>') then

			local _, ScriptFind = self.File:find('<scr' .. 'ipt>')
			local ScriptEnd = self.File:find('</scr' .. 'ipt>')

			if ScriptEnd then
				ScriptEnd = ScriptEnd-1
			end

			local DownloadedSize = self.File:sub(ScriptFind+1, ScriptEnd or -1):len()

			self.DownloadStatus = 'Downloading Script (' .. math.round(100/self.Size*DownloadedSize,2) .. '%)'
		end

	end

	if self.File:find('</scr' .. 'ipt>') then
		self.DownloadStatus = 'Downloading Script (100%)'

		local a,b = self.File:find('\r\n\r\n')

		self.File = self.File:sub(a,-1)
		self.NewFile = ''

		for line,content in ipairs(self.File:split('\n')) do

			if content:len() > 5 then
				self.NewFile = self.NewFile .. content
			end

		end

		local HeaderEnd, ContentStart = self.NewFile:find('<sc' .. 'ript>')
		local ContentEnd, _ = self.NewFile:find('</scr' .. 'ipt>')

		if not (ContentStart and ContentEnd) then

			if self.CallbackError and type(self.CallbackError) == 'function' then
				self.CallbackError()
			end

		else

			local newf = self.NewFile:sub(ContentStart+1,ContentEnd-1)
			local newf = newf:gsub('\r','')

			if newf:len() ~= self.Size then

				if self.CallbackError and type(self.CallbackError) == 'function' then
					self.CallbackError()
				end

				return
			end

			local newf = Base64Decode(newf)

			if type(load(newf)) ~= 'function' then

				if self.CallbackError and type(self.CallbackError) == 'function' then
					self.CallbackError()
				end

			else

				local f = io.open(self.SavePath,"w+b")

				f:write(newf)
				f:close()

				if self.CallbackUpdate and type(self.CallbackUpdate) == 'function' then
					self.CallbackUpdate(self.OnlineVersion, self.LocalVersion)
				end

			end

		end

		self.GotScriptUpdate = true
	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function OnLoad()

	local H = HTTF_Blitzcrank()

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:__init()
	self:Update()
	self:Variables()
	self:Menu()

	AddTickCallback(function() self:OnTick() end)
	AddDrawCallback(function() self:OnDraw() end)

	--AddAnimationCallback(function(...) self:OnAnimation(...) end)
	--AddProcessAttackCallback(function(...) self:OnProcessAttack(...) end)
	AddProcessSpellCallback(function(...) self:OnProcessSpell(...) end)
	AddUpdateBuffCallback(function(...) self:OnUpdateBuff(...) end)
	AddRemoveBuffCallback(function(...) self:OnRemoveBuff(...) end)
	--AddRecvPacketCallback2(function(p) self:OnRecvPacket(p) end)
	--AddSendPacketCallback(function(p) self:OnSendPacket(p) end)
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:Update()

	local Script = {}

	Script.Host = "raw.githubusercontent.com"
	Script.VersionPath = "/BolHTTF/BoL/master/HTTF/Version/HTTF%20Blitzcrank.version"
	Script.Path = "/BolHTTF/BoL/master/HTTF/HTTF%20Blitzcrank.lua"
	Script.SavePath = SCRIPT_PATH .. FileName
	Script.CallbackUpdate = function(NewVersion, OldVersion) self:ScriptMsg("Updated to " .. NewVersion) end
	Script.CallbackNoUpdate = function(OldVersion) self:ScriptMsg("No Updates Found") end
	Script.CallbackNewVersion = function(NewVersion) self:ScriptMsg("New Version found (" .. NewVersion .. "). Please wait until its downloaded") end
	Script.CallbackError = function(NewVersion) self:ScriptMsg("Error while Downloading. Please try again") end
	ScriptUpdate(Version, true, Script.Host, Script.VersionPath, Script.Path, Script.SavePath, Script.CallbackUpdate,Script.CallbackNoUpdate, Script.CallbackNewVersion,Script.CallbackError)
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:Variables()
	self.GuardianAngleMemory = {}

	self.Q = {delay = 0.25, range = 1050, speed = 1800, width = 140}
	self.R = {delay = 0.25, range = 0, radius = 550}

	self.F = {range = 400}
	self.I = {range = 600}
	self.S = {range = 560}

	if myHero:GetSpellData(SUMMONER_1).name:lower():find("dot") then
		self.Ignite = SUMMONER_1
	elseif myHero:GetSpellData(SUMMONER_2).name:lower():find("dot") then
		self.Ignite = SUMMONER_2
	end

	if myHero:GetSpellData(SUMMONER_1).name:lower():find("smite") then
		self.Smite = SUMMONER_1
	elseif myHero:GetSpellData(SUMMONER_2).name:lower():find("smite") then
		self.Smite = SUMMONER_2
	end

	if myHero:GetSpellData(SUMMONER_1).name:lower():find("flash") then
		self.Flash = SUMMONER_1
	elseif myHero:GetSpellData(SUMMONER_2).name:lower():find("flash") then
		self.Flash = SUMMONER_2
	end

	self.IsRecall = false
	self.SACLoaded, self.NOWLoaded, self.POWLoaded = nil, nil, nil

	self.PredictionDamage = {}
	self.ProjectileSpeed = {["SRU_OrderMinionRanged"] = 650, ["SRU_ChaosMinionRanged"] = 650, ["SRU_OrderMinionSiege"] = 1200, ["SRU_ChaosMinionSiege"] = 1200, ["SRUAP_Turret_Chaos1"] = 1200, ["SRUAP_Turret_Chaos2"] = 1200, ["SRUAP_Turret_Order1"] = 1200, ["SRUAP_Turret_Order2"] = 1200}

	if GetGame().map.index == 15 then
		self.FocusJungleNames =
		{
		"SRU_Baron12.1.1",
		"SRU_Blue1.1.1",
		"SRU_Blue7.1.1",
		"Sru_Crab15.1.1",
		"Sru_Crab16.1.1",
		"SRU_Dragon6.1.1",
		"SRU_Gromp13.1.1",
		"SRU_Gromp14.1.1",
		"SRU_Krug5.1.2",
		"SRU_Krug11.1.2",
		"SRU_Murkwolf2.1.1",
		"SRU_Murkwolf8.1.1",
		"SRU_Razorbeak3.1.1",
		"SRU_Razorbeak9.1.1",
		"SRU_Red4.1.1",
		"SRU_Red10.1.1",
		"SRU_RiftHerald17.1.1"
		}
		self.JungleMobNames =
		{
		"SRU_BlueMini1.1.2",
		"SRU_BlueMini7.1.2",
		"SRU_BlueMini21.1.3",
		"SRU_BlueMini27.1.3",
		"SRU_KrugMini5.1.1",
		"SRU_KrugMini11.1.1",
		"SRU_MurkwolfMini2.1.2",
		"SRU_MurkwolfMini2.1.3",
		"SRU_MurkwolfMini8.1.2",
		"SRU_MurkwolfMini8.1.3",
		"SRU_RazorbeakMini3.1.2",
		"SRU_RazorbeakMini3.1.3",
		"SRU_RazorbeakMini3.1.4",
		"SRU_RazorbeakMini9.1.2",
		"SRU_RazorbeakMini9.1.3",
		"SRU_RazorbeakMini9.1.4",
		"SRU_RedMini4.1.2",
		"SRU_RedMini4.1.3",
		"SRU_RedMini10.1.2",
		"SRU_RedMini10.1.3"
		}
	elseif GetGame().map.index == 4 then
		self.FocusJungleNames =
		{
		"TT_NWraith1.1.1",
		"TT_NGolem2.1.1",
		"TT_NWolf3.1.1",
		"TT_NWraith4.1.1",
		"TT_NGolem5.1.1",
		"TT_NWolf6.1.1",
		"TT_Spiderboss8.1.1"
		}	 
		self.JungleMobNames =
		{
		"TT_NWraith21.1.2",
		"TT_NWraith21.1.3",
		"TT_NGolem22.1.2",
		"TT_NWolf23.1.2",
		"TT_NWolf23.1.3",
		"TT_NWraith24.1.2",
		"TT_NWraith24.1.3",
		"TT_NGolem25.1.1",
		"TT_NWolf26.1.2",
		"TT_NWolf26.1.3"
		}
	else
		self.FocusJungleNames =
		{
		}	 
		self.JungleMobNames =
		{
		}
	end

	self.EnemyHeroes = GetEnemyHeroes()
	self.EnemyMinions = minionManager(MINION_ENEMY, self.Q.range, myHero, MINION_SORT_MAXHEALTH_ASC)
	self.JungleMobs = minionManager(MINION_JUNGLE, self.Q.range+300, myHero, MINION_SORT_MAXHEALTH_DEC)
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:Menu()

	self.Menu = scriptConfig("HTTF Blitzcrank", "HTTF Blitzcrank")

	self.Menu:addSubMenu("BlackList (don't grab)", "BlackList")

		self.Menu.BlackList:addSubMenu("Combo", "Combo")
		self.Menu.BlackList:addSubMenu("Harass", "Harass")
		self.Menu.BlackList:addSubMenu("Auto (KPred)", "Auto")

		for i, enemy in ipairs(self.EnemyHeroes) do
			self.Menu.BlackList.Combo:addParam(enemy.charName, enemy.charName, SCRIPT_PARAM_ONOFF, false)
			self.Menu.BlackList.Harass:addParam(enemy.charName, enemy.charName, SCRIPT_PARAM_ONOFF, false)
			self.Menu.BlackList.Auto:addParam(enemy.charName, enemy.charName, SCRIPT_PARAM_ONOFF, false)
		end

	self.Menu:addSubMenu("Combo Settings", "Combo")

		self.Menu.Combo:addSubMenu("Ulti", "Ulti")
			self.Menu.Combo.Ulti:addParam("UseRS", "Use R (single target)", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Combo.Ulti:addParam("RMP", "If mana percent >= x", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
			self.Menu.Combo.Ulti:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Combo.Ulti:addParam("UseRM", "Use R (multiple target)", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Combo.Ulti:addParam("RMin", "If enemy count >= x", SCRIPT_PARAM_SLICE, 2, 2, 5, 0)

		self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Combo:addParam("On", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
		self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Combo:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Combo:addParam("QMP", "If mana percent >= x", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
		--self.Menu.Combo:addParam("ChannelQ", "Grab channeling enemy", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Combo:addParam("UseW", "Use W", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Combo:addParam("WMP", "If mana percent >= x", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
		self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Combo:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Combo:addParam("EMP", "If mana percent >= x", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)

	self.Menu:addSubMenu("Harass Settings", "Harass")
		self.Menu.Harass:addParam("On", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('C'))
		self.Menu.Harass:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Harass:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Harass:addParam("QMP", "If mana percent >= x", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
		self.Menu.Harass:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Harass:addParam("UseW", "Use W", SCRIPT_PARAM_ONOFF, false)
		self.Menu.Harass:addParam("WMP", "If mana percent >= x", SCRIPT_PARAM_SLICE, 70, 0, 100, 0)
		self.Menu.Harass:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Harass:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Harass:addParam("EMP", "If mana percent >= x", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)

	self.Menu:addSubMenu("Kill Steal Settings", "KillSteal")
		self.Menu.KillSteal:addParam("On", "Kill Steal", SCRIPT_PARAM_ONOFF, true)
		self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.KillSteal:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.KillSteal:addParam("UseR", "Use R", SCRIPT_PARAM_ONOFF, false)
		
	self.Menu:addSubMenu("Auto Grab Settings (KPred)", "Auto")
		self.Menu.Auto:addParam("On", "Auto grab on enemy dash", SCRIPT_PARAM_ONOFF, true)

	self.Menu:addSubMenu("Clear Settings", "Clear")

		self.Menu.Clear:addSubMenu("Lane Clear Settings", "Farm")
			self.Menu.Clear.Farm:addParam("On", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('V'))
			self.Menu.Clear.Farm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Clear.Farm:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, false)
			self.Menu.Clear.Farm:addParam("QMP", "If mana percent >= x", SCRIPT_PARAM_SLICE, 80, 0, 100, 0)
			self.Menu.Clear.Farm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Clear.Farm:addParam("UseW", "Use W", SCRIPT_PARAM_ONOFF, false)
			self.Menu.Clear.Farm:addParam("WMP", "If mana percent >= x", SCRIPT_PARAM_SLICE, 80, 0, 100, 0)
			self.Menu.Clear.Farm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Clear.Farm:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, false)
			self.Menu.Clear.Farm:addParam("EMP", "If mana percent >= x", SCRIPT_PARAM_SLICE, 70, 0, 100, 0)
			self.Menu.Clear.Farm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Clear.Farm:addParam("UseRM", "Use R (multiple target)", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Clear.Farm:addParam("RMin", "If mobs count >= x", SCRIPT_PARAM_SLICE, 10, 1, 20, 0)

		self.Menu.Clear:addSubMenu("Jungle Clear Settings", "JFarm")
			self.Menu.Clear.JFarm:addParam("On", "Jungle Clear", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('V'))
			self.Menu.Clear.JFarm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Clear.JFarm:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Clear.JFarm:addParam("QMP", "If mana percent >= x", SCRIPT_PARAM_SLICE, 70, 0, 100, 0)
			self.Menu.Clear.JFarm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Clear.JFarm:addParam("UseW", "Use W", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Clear.JFarm:addParam("WMP", "If mana percent >= x", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
			self.Menu.Clear.JFarm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Clear.JFarm:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Clear.JFarm:addParam("EMP", "If mana percent >= x", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)

	self.Menu:addSubMenu("Last Hit Settings", "LastHit")
		self.Menu.LastHit:addParam("On", "Last Hit", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('X'))
		self.Menu.LastHit:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.LastHit:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, false)
		self.Menu.LastHit:addParam("QMP", "if mana percent >= x", SCRIPT_PARAM_SLICE, 80, 0, 100, 0)

	self.Menu:addSubMenu("Flee Settings", "Flee")
		self.Menu.Flee:addParam("On", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('G'))
		self.Menu.Flee:addParam("UseW", "Use W", SCRIPT_PARAM_ONOFF, false)

	self.Menu:addSubMenu("Misc", "Misc")
		self.Menu.Misc:addParam("GrabSTarget", "Grab only selected target", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Misc:addParam("GrabMinRange", "Min range to grab position", SCRIPT_PARAM_SLICE, 300, 0, 800, -1)
		self.Menu.Misc:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Misc:addParam("GrabE", "Cast E when enemy is grabbed", SCRIPT_PARAM_ONOFF, true)
		--self.Menu.Misc:addParam("GrabR", "Cast R when enemy is grabbed", SCRIPT_PARAM_ONOFF, true)

	self.Menu:addSubMenu("Draw Settings", "Draw")
		self.Menu.Draw:addParam("On", "Draw", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Draw:addParam("Lfc", "Draw lag free circles", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Draw:addParam("STarget", "Draw selected target", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Draw:addParam("Line", "Draw line to Q position", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Draw:addParam("AA", "Draw attack range", SCRIPT_PARAM_ONOFF, false)
		self.Menu.Draw:addParam("Q", "Draw Q range", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Draw:addParam("R", "Draw R radius", SCRIPT_PARAM_ONOFF, true)

		if self.Ignite ~= nil then
		self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Draw:addParam("I", "Draw ignite range", SCRIPT_PARAM_ONOFF, false)
		end

	self.Menu:addSubMenu("Prediction Settings", "Prediction")

		if not VIP_USER then
			self.Menu.Prediction:addParam("Choice", "Choose Prediction", SCRIPT_PARAM_LIST, 1, {"HPrediction"})

			if self.Menu.Prediction.Choice == 2 then
				self.Menu.Prediction.Choice = 1
			end

		else
			self.Menu.Prediction:addParam("Choice", "Choose Prediction", SCRIPT_PARAM_LIST, 2, {"HPrediction", "KPrediction"})
		end

		self.Menu.Prediction:addSubMenu("Q HitChance - Combo", "Combo")
		self.Menu.Prediction:addSubMenu("Q HitChance - Harass", "Harass")

		self:LoadPrediction(self.Menu.Prediction.Choice)
		self.Menu.Prediction:setCallback("Choice", function(var) self:LoadPrediction(self.Menu.Prediction.Choice) end)

	self.Menu:addSubMenu("Orbwalker Settings", "Orbwalker")
		self.Menu.Orbwalker:addParam("Enable", "Enable Orbwalker", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Orbwalker:addParam("Choice", "Choose Orbwalker", SCRIPT_PARAM_LIST, 2, {"Sida's Auto Carry", "Nebelwolfi's Orb Walker", "Pewalk"})
		self.Menu.Orbwalker:setCallback("Enable", function(var) if not var then self:UnloadOrbwalker() elseif not (self.SACLoaded or self.NOWLoaded or self.POWLoaded) then self:LoadOrbwalker(self.Menu.Orbwalker.Choice) end end)
		self.Menu.Orbwalker:setCallback("Choice", function(var) if self.Menu.Orbwalker.Enable then if not (self.SACLoaded or self.NOWLoaded or self.POWLoaded) then self:LoadOrbwalker(self.Menu.Orbwalker.Choice) else self:ScriptMsg("Press F9 twice to load Orbwalker you choose") end end end)

		if self.Menu.Orbwalker.Enable then
			self:LoadOrbwalker(self.Menu.Orbwalker.Choice)
		end

	self.Menu:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
	self.Menu:addParam("Info", "http://botoflegends.com", SCRIPT_PARAM_INFO, "")
	self.Menu:addParam("SVersion", "Script version: ", SCRIPT_PARAM_LIST, 1, {"" .. Version})

	self.Menu.Combo.On = false
	self.Menu.Harass.On = false
	self.Menu.Clear.Farm.On = false
	self.Menu.Clear.JFarm.On = false
	self.Menu.LastHit.On = false
	self.Menu.Flee.On = false

	if self.Smite then
	self.SMenu = scriptConfig("HTTF Smite", "HTTF Smite")

	self.SMenu:addSubMenu("Jungle Steal Settings", "JSteal")
		self.SMenu.JSteal:addParam("On", "Use smite toggle", SCRIPT_PARAM_ONKEYTOGGLE, true, GetKey('N'))
		self.SMenu.JSteal:addParam("Dragon", "Always steal dragon", SCRIPT_PARAM_ONOFF, true)

	self.SMenu:addSubMenu("Kill Steal Settings", "KillSteal")
		self.SMenu.KillSteal:addParam("On", "Use stalker's blade", SCRIPT_PARAM_ONOFF, true)

	self.SMenu:addSubMenu("Draw Settings", "Draw")

		self.SMenu.Draw:addParam("On", "Draw", SCRIPT_PARAM_ONOFF, true)
		self.SMenu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.SMenu.Draw:addParam("S", "Draw smite range", SCRIPT_PARAM_ONOFF, true)
	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:LoadOrbwalker(choice)

	if choice == 1 then

		if _G.NebelwolfisOrbWalkerInit or _G.NebelwolfisOrbWalkerLoaded then
			self.NOWLoaded = true
			self:ErrorMsg("Sida's Auto Carry is not loaded by Nebelwolfi's Orb Walker")
			return
		end

		if _Pewalk then
			self.POWLoaded = true
			self:ErrorMsg("Sida's Auto Carry is not loaded by Pewalk")
			return
		end

		if _G.Reborn_Loaded then
			self.SACLoaded = true

			if _G.AutoCarry and _G.Reborn_Initialised then
				self.Menu.Orbwalker:addParam("Info", "Sida's Auto Carry is detected", SCRIPT_PARAM_INFO, "")
			else
				DelayAction(function() self:LoadOrbwalker(1) end, 1)
			end

		else

			local function UpdateSAC()

				if FileExist(SCRIPT_PATH .. "Sida's Auto Carry.lua") then
					self:ErrorMsg("Sida's Auto Carry is not injected")
					self.Menu.Orbwalker:addParam("Info", "Sida's Auto Carry is not injected", SCRIPT_PARAM_INFO, "")
				else
					DownloadFile("https://raw.githubusercontent.com/SidaBoL/Scripts/master/Misc/Sida's%20Auto%20Carry.lua", SCRIPT_PATH .. "Sida's Auto Carry.lua", function() UpdateSAC() end)
				end

			end

			UpdateSAC()
		end

	elseif choice == 2 then

		if _G.Reborn_Loaded then
			self.SACLoaded = true
			self:ErrorMsg("Nebelwolfi's Orb Walker is not loaded by Sida's Auto Carry")
			return
		end

		if _Pewalk then
			self.POWLoaded = true
			self:ErrorMsg("Nebelwolfi's Orb Walker is not loaded by Pewalk")
			return
		end

		if _G.NebelwolfisOrbWalkerInit or _G.NebelwolfisOrbWalkerLoaded then
			self.NOWLoaded = true
			self.Menu.Orbwalker:addParam("Info", "Nebelwolfi's Orb Walker is detected", SCRIPT_PARAM_INFO, "")
		else

			local function UpdateNOW()

				if FileExist(LIB_PATH .. "Nebelwolfi's Orb Walker.lua") then
					require("Nebelwolfi's Orb Walker")
					NebelwolfisOrbWalkerClass()
					self.NOWLoaded = true
					self.Menu.Orbwalker:addParam("Info", "Nebelwolfi's Orb Walker is detected", SCRIPT_PARAM_INFO, "")
				else
					DownloadFile("https://raw.githubusercontent.com/nebelwolfi/BoL/master/Common/Nebelwolfi%27s%20Orb%20Walker.lua", LIB_PATH .. "Nebelwolfi's Orb Walker.lua", function() UpdateNOW() end)
				end

			end

			UpdateNOW()
		end

	elseif choice == 3 then

		if _G.Reborn_Loaded then
			self.SACLoaded = true
			self:ErrorMsg("Pewalk is not loaded by Sida's Auto Carry")
			return
		end

		if _G.NebelwolfisOrbWalkerInit or _G.NebelwolfisOrbWalkerLoaded then
			self.NOWLoaded = true
			self:ErrorMsg("Pewalk is not loaded by Nebelwolfi's Orb Walker")
			return
		end

		if _Pewalk then
			self.POWLoaded = true
			self.Menu.Orbwalker:addParam("Info", "Pewalk is detected", SCRIPT_PARAM_INFO, "")

			local function Disable()

				if _Pewalk.DisableSkillFarm then
					_Pewalk.DisableSkillFarm(_Q) _Pewalk.DisableSkillFarm(_E)
				else
					DelayAction(function() Disable() end, 1)
				end

			end

			Disable()
		else

			local function UpdatePOW()

				if FileExist(SCRIPT_PATH .. "Pewalk.lua") then
					self:ErrorMsg("Pewalk is not injected")
					self.Menu.Orbwalker:addParam("Info", "Pewalk is not injected", SCRIPT_PARAM_INFO, "")
				else
					DownloadFile("https://raw.githubusercontent.com/PewPewPew2/BoL/master/Pewalk.lua", SCRIPT_PATH .. "Pewalk.lua", function() UpdatePOW() end)
				end

			end

			UpdatePOW()
		end

	end

end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:UnloadOrbwalker()

	if self.SACLoaded or self.NOWLoaded or self.POWLoaded then
		self:ScriptMsg("Press F9 twice to unload the Orbwalker")
	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:AfterAA()

	if self.SACLoaded then
		return not _G.AutoCarry.Orbwalker:CanShoot() and not _G.AutoCarry.Orbwalker:IsShooting()
	elseif self.NOWLoaded then
		return not _G.NebelwolfisOrbWalker:TimeToAttack() and _G.NebelwolfisOrbWalker:TimeToMove()
	elseif self.POWLoaded then
		return not _Pewalk.CanAttack() and _Pewalk.CanMove()
	end

end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:CanAA()

	if self.SACLoaded then
		return _G.AutoCarry.Orbwalker:CanShoot()
	elseif self.NOWLoaded then
		return _G.NebelwolfisOrbWalker:TimeToAttack()
	elseif self.POWLoaded then
		return _Pewalk.CanAttack()
	end

end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:CanMove()

	if self.SACLoaded then
		return not _G.AutoCarry.Orbwalker:IsShooting()
		--return _G.AutoCarry.Orbwalker:CanMove()
	elseif self.NOWLoaded then
		return _G.NebelwolfisOrbWalker:TimeToMove()
	elseif self.POWLoaded then
		return _Pewalk.CanMove()
	end

end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:ResetAA()

	if self.SACLoaded then
		_G.AutoCarry.Orbwalker:ResetAttackTimer()
	elseif self.NOWLoaded then
		_G.NebelwolfisOrbWalker:ResetAA()
	elseif self.POWLoaded then
		--Auto
	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:LoadPrediction(choice)

	if choice == 1 and not self.HPred then

		if _G.HPrediction_Init then
			self.HPred = HPrediction()
			self.HPred_Q = HPSkillshot({type = "DelayLine", delay = self.Q.delay, range = self.Q.range, speed = self.Q.speed, collision = true, width = self.Q.width})
			self.HPred_Q_M = HPSkillshot({type = "DelayLine", delay = self.Q.delay, range = self.Q.range, speed = self.Q.speed, collisionM = true, width = self.Q.width})
			self.HPred_R = HPSkillshot({type = "PromptCircle", delay = self.R.delay, range = self.R.range, radius = self.R.radius})
			self.Menu.Prediction:addParam("Info", "HPrediction is detected", SCRIPT_PARAM_INFO, "")
			self.Menu.Prediction.Combo:addParam("HPred", "[HPrediction] HitChacne (1.3)", SCRIPT_PARAM_SLICE, 1.3, 1, 3, 1)
			self.Menu.Prediction.Harass:addParam("HPred", "[HPrediction] HitChacne (2)", SCRIPT_PARAM_SLICE, 2, 1, 3, 1)
		else

			local function UpdateHPred()

				if FileExist(LIB_PATH .. "HPrediction.lua") then
					require("HPrediction")
					self.HPred = HPrediction()
					self.HPred_Q = HPSkillshot({type = "DelayLine", delay = self.Q.delay, range = self.Q.range, speed = self.Q.speed, collision = true, width = self.Q.width})
					self.HPred_Q_M = HPSkillshot({type = "DelayLine", delay = self.Q.delay, range = self.Q.range, speed = self.Q.speed, collisionM = true, width = self.Q.width})
					self.HPred_R = HPSkillshot({type = "PromptCircle", delay = self.R.delay, range = self.R.range, radius = self.R.radius})
					self.Menu.Prediction:addParam("Info", "HPrediction is detected", SCRIPT_PARAM_INFO, "")
					self.Menu.Prediction.Combo:addParam("HPred", "[HPrediction] HitChacne (1.3)", SCRIPT_PARAM_SLICE, 1.3, 1, 3, 1)
					self.Menu.Prediction.Harass:addParam("HPred", "[HPrediction] HitChacne (2)", SCRIPT_PARAM_SLICE, 2, 1, 3, 1)
				else
					DownloadFile("https://raw.githubusercontent.com/BolHTTF/BoL/master/HTTF/Common/HPrediction.lua", LIB_PATH .. "HPrediction.lua", function() UpdateHPred() end)
				end

			end

			UpdateHPred()
		end

	elseif choice == 2 and not self.KPred then

		if _G.KPrediction_Init then
			self.KPred = KPrediction()
			self.KPred_Q = KPSkillshot({type = "DelayLine", delay = self.Q.delay, range = self.Q.range, speed = self.Q.speed, collision = true, width = self.Q.width})
			self.KPred_Q_M = KPSkillshot({type = "DelayLine", delay = self.Q.delay, range = self.Q.range, speed = self.Q.speed, collision_M = true, width = self.Q.width})
			self.KPred_R = KPSkillshot({type = "PromptCircle", delay = self.R.delay, range = self.R.range, radius = self.R.radius})
			self.Menu.Prediction:addParam("Info", "KPrediction is detected", SCRIPT_PARAM_INFO, "")
			self.Menu.Prediction.Combo:addParam("KPred", "[KPrediction] HitChacne (1.5)", SCRIPT_PARAM_SLICE, 1.5, 1, 4, 1)
			self.Menu.Prediction.Harass:addParam("KPred", "[KPrediction] HitChacne (2)", SCRIPT_PARAM_SLICE, 2, 1, 4, 1)
		else

			local function UpdateKPred()

				if FileExist(LIB_PATH .. "KPrediction.lua") then
					require("KPrediction")
					self.KPred = KPrediction()
					self.KPred_Q = KPSkillshot({type = "DelayLine", delay = self.Q.delay, range = self.Q.range, speed = self.Q.speed, collision = true, width = self.Q.width})
					self.KPred_Q_M = KPSkillshot({type = "DelayLine", delay = self.Q.delay, range = self.Q.range, speed = self.Q.speed, collision_M = true, width = self.Q.width})
					self.KPred_R = KPSkillshot({type = "PromptCircle", delay = self.R.delay, range = self.R.range, radius = self.R.radius})
					self.Menu.Prediction:addParam("Info", "KPrediction is detected", SCRIPT_PARAM_INFO, "")
					self.Menu.Prediction.Combo:addParam("KPred", "[KPrediction] HitChacne (1.5)", SCRIPT_PARAM_SLICE, 1.5, 1, 4, 1)
					self.Menu.Prediction.Harass:addParam("KPred", "[KPrediction] HitChacne (2)", SCRIPT_PARAM_SLICE, 2, 1, 4, 1)
				else
					DownloadFile("https://raw.githubusercontent.com/BolHTTF/BoL/master/HTTF/Common/KPrediction.lua", LIB_PATH .. "KPrediction.lua", function() UpdateKPred() end)
				end

			end

			UpdateKPred()
		end

	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:GetTrueRange(unit)
	return myHero.range+self:GetBoundingRadius(myHero)+self:GetBoundingRadius(unit)-10
end

function HTTF_Blitzcrank:GetBoundingRadius(unit)
	return unit.boundingRadius
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:GetManaPercent(unit)
	return (unit.mana/unit.maxMana)*100
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:IsInvulnerable(unit, time)

	if not self:IsValid(unit) then
		return true
	end

	local time = time or 0

	if time < 0 then
		time = 0
	end

	if time == 0 and unit.bInvulnerable == 1 then
		return true
	end

	local memory = self.GuardianAngleMemory[unit.networkID]

	if memory and os.clock()+time <= memory.tEnd-GetLatency()/1000 then
		return true
	end

	for i = 1, unit.buffCount do

		local buff = unit:getBuff(i)

		if buff and buff.name and (buff.name == "zhonyasringshield" or buff.name == "JudicatorIntervention" or buff.name == "UndyingRage" or buff.name == "VladimirSanguinePool") and GetGameTimer()+time <= buff.endT-GetLatency()/1000 then
			return true
		end

	end

	return false
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:IsTargetable(unit, time)

	if not self:IsValid(unit) then
		return false
	end

	local time = time or 0

	if time < 0 then
		time = 0
	end

	if time == 0 and not unit.bTargetable then
		return false
	end

	local memory = self.GuardianAngleMemory[unit.networkID]

	if memory and os.clock()+time <= memory.tEnd-GetLatency()/1000 then
		return false
	end

	for i = 1, unit.buffCount do

		local buff = unit:getBuff(i)

		if buff and buff.name and (buff.name == "zhonyasringshield" or buff.name == "VladimirSanguinePool") and GetGameTimer()+time <= buff.endT-GetLatency()/1000 then
			return false
		end

	end

	return true
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:IsValid(unit, distance, time)
	return unit ~= nil and unit.valid and unit.visible and not unit.dead and (distance == nil or GetDistanceSqr(unit) <= distance*distance) and (time == nil or self:IsTargetable(unit, time) and not self:IsInvulnerable(unit, time))
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:Level(spell)
	return myHero:GetSpellData(spell).level
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:MoveToPos(movePos)
	myHero:MoveTo(movePos.x, movePos.z)
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:Ready(spell)
	return spell and myHero:CanUseSpell(spell) == READY
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:OnTick()

	if Debug then
		self:Debug()
	end

	if myHero.dead then
		return
	end

	for i = 1, #self.EnemyMinions.objects do

		local minion = self.EnemyMinions.objects[i]

		if self.PredictionDamage[minion.networkID] then

			local Delete = true

			for ctime, damage in pairs(self.PredictionDamage[minion.networkID]) do

				if os.clock() < ctime then
					Delete = false
					break
				end

			end

			if Delete then
				self.PredictionDamage[minion.networkID] = nil
			end

		end

	end

	if self.Menu.KillSteal.On then
		self:KillSteal()
	end

	if self.Smite and self:Ready(self.Smite) then

		if self.SMenu.JSteal.On then
			self:JSteal()
		end

		if self.SMenu.KillSteal.On then
			self:SKillSteal()
		end

		self:JStealAlways()
	end

	self:Targets()

	if self.KPred and self.Menu.Auto.On and not self.IsRecall then
		self:Auto()
	end

	if self.Menu.Combo.On then
		self:Combo()
	end

	if self.Menu.Harass.On then
		self:Harass()
	end

	if self.Menu.Clear.Farm.On then
		self:Farm()
	end

	if self.Menu.Clear.JFarm.On then
		self:JFarm()
	end

	if self.Menu.LastHit.On then
		self:LastHit()
	end

	if self.Menu.Flee.On then
		self:Flee()
	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:Debug()

	for i = ITEM_1, ITEM_6 do

		if myHero:GetSpellData(i) and myHero:GetSpellData(i).name ~= "BaseSpell" then
			print("(" .. i .. "): " .. myHero:GetSpellData(i).name)
		end

	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:KillSteal()

	if self.Menu.KillSteal.UseR and self:Ready(_R) then

		for i = 1, #self.EnemyHeroes do

			local hero = self.EnemyHeroes[i]

			if self:IsValid(hero, self.R.radius) and self:GetDmg("R", hero) >= self:GetHealth(hero, self.R.delay) then
				self:CastR(hero)
			end

		end

	end

	if self.Menu.Combo.UseQ and self:Ready(_Q) then

		for i = 1, #self.EnemyHeroes do

			local hero = self.EnemyHeroes[i]

			if self:IsValid(hero, self.Q.range+500) and self:GetDmg("Q", hero) >= self:GetHealth(hero, self.Q.delay) then
				self:CastQ(hero)
			end

		end

	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:Auto()

	if self:Ready(_Q) then

		for i = 1, #self.EnemyHeroes do

			local hero = self.EnemyHeroes[i]

			if self:IsValid(hero, self.Q.range+500) then
				self:CastQ(hero, "Auto")
			end

		end

	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:Targets()
	self.EnemyMinions:update()
	self.JungleMobs:update()

	local T = GetTarget()

	if self:IsValid(T) and T.type == myHero.type and T.team ~= myHero.team then
		self.STarget = T
	else
		self.STarget = nil
	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:Combo()

	if self.Menu.Combo.Ulti.UseRM and self:Ready(_R)then

		local RNoH = 0

		if self.Menu.Prediction.Choice == 1 and self.HPred then
			RNoH = self.HPred:NumberofHits(self.HPred_R, myHero, myHero)
		elseif self.Menu.Prediction.Choice == 2 and self.KPred then
			RNoH = #self.KPred:GetHeroes(self.KPred_R, myHero, myHero)
		else
			self:ScriptMsg("Prediction is not loaded")
			return
		end

		if RNoH >= self.Menu.Combo.Ulti.RMin then
			CastSpell(_R)
		end

	end

	if self.Menu.Combo.Ulti.UseRS and self:Ready(_R) and self.Menu.Combo.Ulti.RMP <= self:GetManaPercent(myHero) then

		for i = 1, #self.EnemyHeroes do

			local hero = self.EnemyHeroes[i]

			if self:IsValid(hero, 1000) then
				self:CastR(hero)
			end

		end

	end

	if self.Menu.Combo.UseQ and self:Ready(_Q) and self.Menu.Combo.QMP <= self:GetManaPercent(myHero) then

		if self.Menu.Misc.GrabSTarget and self.STarget and GetDistanceSqr(self.STarget) <= self.Q.range*self.Q.range then
			self:CastQ(self.STarget, "Combo_S")
		else

			for i = 1, #self.EnemyHeroes do

				local hero = self.EnemyHeroes[i]

				if self:IsValid(hero, self.Q.range+500) then
					self:CastQ(hero, "Combo")
				end

			end

		end

	end

	if self.Menu.Combo.UseW and self:Ready(_W) and self.Menu.Combo.WMP <= self:GetManaPercent(myHero) then

		for i = 1, #self.EnemyHeroes do

			local hero = self.EnemyHeroes[i]

			if self:IsValid(hero, self:GetTrueRange(hero)) then
				self:CastW(hero)
			end

		end

	end

	if self.Menu.Combo.UseE and self:Ready(_E) and self.Menu.Combo.EMP <= self:GetManaPercent(myHero) and (self:AfterAA() or self:CanAA()) then

		for i = 1, #self.EnemyHeroes do

			local hero = self.EnemyHeroes[i]

			if self:IsValid(hero, self:GetTrueRange(hero)) then
				self:CastE(hero)
			end

		end

	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:Harass()

	if self.Menu.Harass.UseQ and self:Ready(_Q) and self.Menu.Harass.QMP <= self:GetManaPercent(myHero) then

		if self.Menu.Misc.GrabSTarget and self.STarget and GetDistanceSqr(self.STarget) <= self.Q.range*self.Q.range then
			self:CastQ(self.STarget, "Harass_S")
		else

			for i = 1, #self.EnemyHeroes do

				local hero = self.EnemyHeroes[i]

				if self:IsValid(hero, self.Q.range+500) then
					self:CastQ(hero, "Harass")
				end

			end

		end

	end

	if self.Menu.Harass.UseW and self:Ready(_W) and self.Menu.Harass.WMP <= self:GetManaPercent(myHero) then

		for i = 1, #self.EnemyHeroes do

			local hero = self.EnemyHeroes[i]

			if self:IsValid(hero, self:GetTrueRange(hero)) then
				self:CastW(hero)
			end

		end

	end

	if self.Menu.Harass.UseE and self:Ready(_E) and self.Menu.Harass.EMP <= self:GetManaPercent(myHero) and (self:AfterAA() or self:CanAA()) then

		for i = 1, #self.EnemyHeroes do

			local hero = self.EnemyHeroes[i]

			if self:IsValid(hero, self:GetTrueRange(hero)) then
				self:CastE(hero)
			end

		end

	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:Farm()

	if self.Menu.Clear.Farm.UseRM and self:Ready(_R)then

		local RNoH = 0

		if self.Menu.Prediction.Choice == 1 and self.HPred then

			for i = 1, #self.EnemyMinions.objects do

				local minion = self.EnemyMinions.objects[i]

				if minion == nil then
					print("error number 1")
				end

				local pos = self.HPred:PredictPos(minion, self.R.delay)

				if pos and GetDistanceSqr(pos) <= self.R.radius*self.R.radius then
					RNoH = RNoH+1
				end

			end

		elseif self.Menu.Prediction.Choice == 2 and self.KPred then
			RNoM = #self.KPred:GetMobs(self.KPred_R, myHero, myHero)
		else
			self:ScriptMsg("Prediction is not loaded")
			return
		end

		if RNoH >= self.Menu.Clear.Farm.RMin then
			CastSpell(_R)
		end

	end

	if self.Menu.Clear.Farm.UseQ and self:Ready(_Q) and self.Menu.Clear.Farm.QMP <= self:GetManaPercent(myHero) then

		for i = 1, #self.EnemyMinions.objects do

			local minion = self.EnemyMinions.objects[i]

			if self:IsValid(minion, self.Q.range) and self:GetDmg("Q", minion) >= self:GetHealth(minion, self.Q.delay) then
				self:CastQ(minion)
			end

		end

	end

	if self.Menu.Clear.Farm.UseW and self:Ready(_W) and self.Menu.Clear.Farm.WMP <= self:GetManaPercent(myHero) then

		for i = 1, #self.EnemyMinions.objects do

			local minion = self.EnemyMinions.objects[i]

			if self:IsValid(minion, self:GetTrueRange(minion)) then
				CastSpell(_W)
				break
			end

		end

	end

	if self.Menu.Clear.Farm.UseE and self:Ready(_E) and self.Menu.Clear.Farm.EMP <= self:GetManaPercent(myHero) and (self:AfterAA() or self:CanAA()) then

		for i = 1, #self.EnemyMinions.objects do

			local minion = self.EnemyMinions.objects[i]

			if self:IsValid(minion, self:GetTrueRange(minion)) then
				CastSpell(_E)
				break
			end

		end

	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:JFarm()

	local LargeJunglemob

	for i = 1, #self.JungleMobs.objects do

		local junglemob = self.JungleMobs.objects[i]

		if self:IsValid(junglemob) then

			for j = 1, #self.FocusJungleNames do

				if junglemob.name == self.FocusJungleNames[j] then
					LargeJunglemob = junglemob
					break
					break
				end

			end

		end

	end

	if LargeJunglemob then

		if self.Menu.Clear.JFarm.UseQ and self:Ready(_Q) and self.Menu.Clear.JFarm.QMP <= self:GetManaPercent(myHero) and GetDistanceSqr(LargeJunglemob) <= self.Q.range*self.Q.range then
			self:CastQ(LargeJunglemob)
		end

		if self.Menu.Clear.JFarm.UseW and self:Ready(_W) and self.Menu.Clear.JFarm.WMP <= self:GetManaPercent(myHero) and GetDistanceSqr(LargeJunglemob) <= self:GetTrueRange(LargeJunglemob)*self:GetTrueRange(LargeJunglemob) then
			CastSpell(_W)
		end

		if self.Menu.Clear.JFarm.UseE and self:Ready(_E) and self.Menu.Clear.JFarm.EMP <= self:GetManaPercent(myHero) and (self:AfterAA() or self:CanAA()) and GetDistanceSqr(LargeJunglemob) <= self:GetTrueRange(LargeJunglemob)*self:GetTrueRange(LargeJunglemob) then
			CastSpell(_E)
		end

	else

		for i = 1, #self.JungleMobs.objects do

			local junglemob = self.JungleMobs.objects[i]

			if self:IsValid(junglemob) then

				if self.Menu.Clear.JFarm.UseQ and self:Ready(_Q) and self.Menu.Clear.JFarm.QMP <= self:GetManaPercent(myHero) and GetDistanceSqr(junglemob) <= self.Q.range*self.Q.range then
					self:CastQ(junglemob)
				end

				if self.Menu.Clear.JFarm.UseW and self:Ready(_W) and self.Menu.Clear.JFarm.WMP <= self:GetManaPercent(myHero) and GetDistanceSqr(junglemob) <= self:GetTrueRange(junglemob)*self:GetTrueRange(junglemob) then
					CastSpell(_W)
					break
				end

				if self.Menu.Clear.JFarm.UseE and self:Ready(_E) and self.Menu.Clear.JFarm.EMP <= self:GetManaPercent(myHero) and (self:AfterAA() or self:CanAA()) and GetDistanceSqr(junglemob) <= self:GetTrueRange(junglemob)*self:GetTrueRange(junglemob) then
					CastSpell(_E)
					break
				end

			end

		end

	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:LastHit()

	if self.Menu.LastHit.UseQ and self:Ready(_Q) and self.Menu.LastHit.QMP <= self:GetManaPercent(myHero) then

		for i = 1, #self.EnemyMinions.objects do

			local minion = self.EnemyMinions.objects[i]

			if self:IsValid(minion, self.Q.range) and self:GetDmg("Q", minion) >= self:GetHealth(minion, self.Q.delay) then
				self:CastQ(minion)
			end

		end

	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:Flee()
	self:MoveToPos(mousePos)

	if self.Menu.Flee.UseW and self:Ready(_W) then
		self:CastW()
	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:JSteal()

	for i, junglemob in pairs(self.JungleMobs.objects) do

		local S_JunglemobDmg = self:GetDmg("Smite", junglemob)

		for j = 1, #self.FocusJungleNames do

			if junglemob.name == self.FocusJungleNames[j] and S_JunglemobDmg >= junglemob.health and ValidTarget(junglemob, self.S.range) then
				self:CastSmite(junglemob)
				return
			end

		end

	end

end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:SKillSteal()
	self.SB = nil

	if myHero:GetSpellData(SUMMONER_1).name:lower() == "s5_summonersmiteplayerganker" then
		self.SB = SUMMONER_1
	elseif myHero:GetSpellData(SUMMONER_2).name:lower() == "s5_summonersmiteplayerganker" then
		self.SB = SUMMONER_2
	end

	if self.SB then

		for i, hero in ipairs(self.EnemyHeroes) do

			local SB_TargetDmg = self:GetDmg("SB", hero)

			if SB_TargetDmg >= hero.health and ValidTarget(hero, self.S.range) then
				self:CastSmite(hero)
				return
			end

		end

	end

end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:JStealAlways()

	for i, junglemob in pairs(self.JungleMobs.objects) do

		local S_JunglemobDmg = self:GetDmg("Smite", junglemob)

		for j = 1, #self.FocusJungleNames do

			if (junglemob.name == "SRU_Baron12.1.1" or self.SMenu.JSteal.Dragon and junglemob.name == "SRU_Dragon6.1.1") and S_JunglemobDmg >= junglemob.health and ValidTarget(junglemob, self.S.range) then
				self:CastSmite(junglemob)
				return
			end

		end

	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:CastQ(unit, mode)

	if mode == "Combo" and self.Menu.BlackList.Combo[unit.charName] or mode == "Harass" and self.Menu.BlackList.Harass[unit.charName] or mode == "Auto" and self.Menu.BlackList.Auto[unit.charName] then
		return
	end

	if self.Menu.Prediction.Choice == 1 and self.HPred then

		if mode == "Combo" or mode == "Harass" then
			self.QPos, self.QHitChance = self.HPred:GetPredict(self.HPred_Q_M, unit, myHero)

			for i = 1, #self.EnemyHeroes do

				local hero = self.EnemyHeroes[i]

				if (mode == "Combo" and self.Menu.BlackList.Combo[unit.charName] or mode == "Harass" and self.Menu.BlackList.Harass[unit.charName]) and self.QPos and self.HPred:EachCollision(self.HPred_Q, unit, myHero, self.QPos, hero) then
					self.QHitChance = -1
					return
				end

			end

		else
			self.QPos, self.QHitChance = self.HPred:GetPredict(self.HPred_Q, unit, myHero)
		end

		if (mode == "Combo" or mode == "Harass") and self.QPos and GetDistanceSqr(self.QPos) <= self.Menu.Misc.GrabMinRange*self.Menu.Misc.GrabMinRange then
			return
		end

		if (mode == "Combo" or mode == "Combo_S") and self.QHitChance >= self.Menu.Prediction.Combo.HPred or (mode == "Harass" or mode == "Harass_S") and self.QHitChance >= self.Menu.Prediction.Harass.HPred or mode == nil and self.QHitChance >= 1 then
			CastSpell(_Q, self.QPos.x, self.QPos.z)
		end

	elseif self.Menu.Prediction.Choice == 2 and self.KPred then

		if mode == "Combo" or mode == "Harass" then
			self.QPos, self.QHitChance = self.KPred:GetPrediction(self.KPred_Q_M, unit, myHero)

			for i = 1, #self.EnemyHeroes do

				local hero = self.EnemyHeroes[i]

				if (mode == "Combo" and self.Menu.BlackList.Combo[unit.charName] or mode == "Harass" and self.Menu.BlackList.Harass[unit.charName]) and self.QPos and self.KPred:GetLineCollision(self.KPred_Q, hero, myHero, self.QPos) then
					self.QHitChance = -1
					return
				end

			end

		else
			self.QPos, self.QHitChance = self.KPred:GetPrediction(self.KPred_Q, unit, myHero)
		end

		if (mode == "Combo" or mode == "Harass" or mode == "Auto") and self.QPos and GetDistanceSqr(self.QPos) <= self.Menu.Misc.GrabMinRange*self.Menu.Misc.GrabMinRange then
			return
		end

		if (mode == "Combo" or mode == "Combo_S") and self.QHitChance >= self.Menu.Prediction.Combo.KPred or (mode == "Harass" or mode == "Harass_S") and self.QHitChance >= self.Menu.Prediction.Harass.KPred or mode == "Auto" and self.QHitChance == 4 or mode == nil and self.QHitChance >= 1 then
			CastSpell(_Q, self.QPos.x, self.QPos.z)
		end

	else
		self:ScriptMsg("Prediction is not loaded")
		return
	end

end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:CastW(unit)

	if unit and (self:IsInvulnerable(unit) or not self:IsTargetable(unit)) then
		return
	end

	CastSpell(_W)
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:CastE(unit)

	if unit and (self:IsInvulnerable(unit) or not self:IsTargetable(unit)) then
		return
	end

	CastSpell(_E)
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:CastR(unit)

	local RPos, RHitChance, RNoH, RHeroes

	if self.Menu.Prediction.Choice == 1 and self.HPred then
		RPos, RHitChance = self.HPred:GetPredict(self.HPred_R, unit, myHero)
	elseif self.Menu.Prediction.Choice == 2 and self.KPred then
		RPos, RHitChance = self.KPred:GetPrediction(self.KPred_R, unit, myHero)
	else
		self:ScriptMsg("Prediction is not loaded")
		return
	end

	if RHitChance >= 3 then
		CastSpell(_R)
	end

end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:CastR_Instantly(unit)

	if self:IsInvulnerable(unit, self.R.dealy) or not self:IsTargetable(unit, self.R.dealy) then
		return
	end

	CastSpell(_R)
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:CastIgnite(unit)

	if self:IsInvulnerable(unit) or not self:IsTargetable(unit) then
		return
	end

	CastSpell(self.Ignite, unit)
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:CastSmite(unit)

	if self:IsInvulnerable(unit) or not self:IsTargetable(unit) then
		return
	end

	CastSpell(self.Smite, unit)
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:CastItem(unit, item)

	if self:IsInvulnerable(unit) or not self:IsTargetable(unit) then
		return
	end

	for i = ITEM_1, ITEM_6 do

		if (item == "Tiamat" or item == "Hydra") and myHero:GetSpellData(i).name == "ItemTiamatCleave" or item == "Titanic" and myHero:GetSpellData(i).name == "ItemTitanicHydraCleave" or item == "Youmu" and myHero:GetSpellData(i).name == "YoumusBlade" then
			CastSpell(i, unit)
			return
		end

	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:GetDmg(spell, unit)

	if unit.dead then
		return 0
	end

	local ADDmg = 0
	local APDmg = 0

	local Level = myHero.level

	local TotalDmg = myHero.totalDamage
	local AddDmg = myHero.addDamage
	local AP = myHero.ap

	local ArmorPen = myHero.armorPen
	local ArmorPenPercent = myHero.armorPenPercent
	local Armor = math.max(0, unit.armor*ArmorPenPercent-ArmorPen)
	local ArmorPercent = Armor/(100+Armor)

	local MagicPen = myHero.magicPen
	local MagicPenPercent = myHero.magicPenPercent
	local MagicArmor = math.max(0, unit.magicArmor*MagicPenPercent-MagicPen)
	local MagicArmorPercent = MagicArmor/(100+MagicArmor)

	if spell == "Ignite" then
		return 50+20*Level
	elseif spell == "Smite" then

		if Level <= 4 then
			return 370+20*Level
		elseif Level <= 9 then 
			return 330+30*Level
		elseif Level <= 14 then
			return 240+40*Level
		else
			return 100+50*Level
		end

	elseif spell == "SB" then
		return 20+8*Level
	elseif spell == "BC" then
		APDmg = 100
	elseif spell == "BRK" then
		ADDmg = math.max(100, .1*unit.maxHealth)
	elseif spell == "AA" then
		ADDmg = TotalDmg
	elseif spell == "Q" then
		APDmg = 25+55*self:Level(_Q)+AP
	elseif spell == "E" then
		ADDmg = TotalDmg*2
	elseif spell == "R" then
		APDmg = 125+125*self:Level(_R)+AP
	end

	return ADDmg*(1-ArmorPercent)+APDmg*(1-MagicArmorPercent)
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:OnDraw()

	if not self.Menu.Draw.On then
		return
	end

	if self.Menu.Draw.STarget and self.STarget then

		if GetDistanceSqr(self.STarget) <= self.Q.range*self.Q.range then
			self:DrawCircle(self.STarget.x, self.STarget.y, self.STarget.z, 2*self.STarget.boundingRadius, ARGB(0xFF, 0x00, 0xFA, 0x9A))
		else
			self:DrawCircle(self.STarget.x, self.STarget.y, self.STarget.z, 2*self.STarget.boundingRadius, ARGB(0xFF, 0xFF, 0x00, 0x00))
		end

	end

	if self.Menu.Draw.AA then
		self:DrawCircle(myHero.x, myHero.y, myHero.z, myHero.range+self:GetBoundingRadius(myHero), ARGB(0xFF, 0, 0xFF, 0))
	end

	if self.Menu.Draw.Q and self:Ready(_Q) then
		self:DrawCircle(myHero.x, myHero.y, myHero.z, self.Q.range, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
	end

	if self.Menu.Draw.Line and self.QPos and self.QHitChance then

		local QColor

		if self.QHitChance == -1 then
			QColor = ARGB(255, 0 ,0, 0)
		elseif self.QHitChance == 0 then
			QColor = ARGB(255, 0 ,0, 0)
		elseif self.QHitChance >= 3 then
			QColor = ARGB(255, 0 ,0, 255)
		else

			local n = (self.QHitChance-1)*255/2

			QColor = ARGB(255, 255-n, n, 0)
		end

		self.QHitChance = nil

		local from = Vector(myHero)
		local to = self.QPos

		local fromL = from+(to-from):perpendicular():normalized()*self.Q.width/2
		local fromR = from+(to-from):perpendicular2():normalized()*self.Q.width/2
		local toL = to+(to-from):perpendicular():normalized()*self.Q.width/2
		local toR = to+(to-from):perpendicular2():normalized()*self.Q.width/2

		DrawLine3D(fromL.x, fromL.y, fromL.z, toL.x, toL.y, toL.z, 3, QColor)
		DrawLine3D(fromL.x, fromL.y, fromL.z, fromR.x, fromR.y, fromR.z, 3, QColor)
		DrawLine3D(fromR.x, fromR.y, fromR.z, toR.x, toR.y, toR.z, 3, QColor)
		DrawLine3D(toL.x, toL.y, toL.z, toR.x, toR.y, toR.z, 3, QColor)
	end

	if self.Menu.Draw.R and self:Ready(_R) then
		self:DrawCircle(myHero.x, myHero.y, myHero.z, self.R.radius, ARGB(0xFF, 0xFF, 0x00, 0x00))
	end

	if self.Smite and self.SMenu.Draw.On and self.SMenu.Draw.S then
		self:DrawSmite()
	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:DrawSmite()

	if self.SMenu.JSteal.On then

		if self:Ready(self.Smite) then
			self:DrawCircle(myHero.x, myHero.y, myHero.z, self.S.range, ARGB(0xFF, 0x99, 0x14, 0x66))
		else
			self:DrawCircle(myHero.x, myHero.y, myHero.z, self.S.range, ARGB(0xFF, 0x14, 0x14, 0x14))
		end

	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:DrawCircle(x, y, z, radius, color)

	if self.Menu.Draw.Lfc then

		local v1 = Vector(cameraPos.x, cameraPos.y, cameraPos.z)
		local v2 = Vector(x, y, z)
		local ClosestPos = v2+(v1-v2):normalized()*radius
		local ScreenPos = WorldToScreen(D3DXVECTOR3(ClosestPos.x, ClosestPos.y, ClosestPos.z))

		if OnScreen({x = ScreenPos.x, y = ScreenPos.y}, {x = ScreenPos.x, y = ScreenPos.y}) then
			self:DrawCircles2(x, y, z, radius, color) 
		end

	else
		DrawCircle(x, y, z, radius, color)
	end

end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:DrawCircles2(x, y, z, radius, color)

	local length = 75
	local radius = radius*.92
	local quality = math.max(50, self:round(180/math.deg((math.asin((length/(2*radius)))))))
	local quality = 2*math.pi/quality
	local points = {}

	for theta = 0, 2*math.pi+quality, quality do

		local c = WorldToScreen(D3DXVECTOR3(x+radius*math.cos(theta), y, z-radius*math.sin(theta)))

		points[#points+1] = D3DXVECTOR2(c.x, c.y)
	end

	DrawLines2(points, 2, color or 4294967295)
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:round(num)

	if num >= 0 then
		return math.floor(num+.5)
	else
		return math.ceil(num-.5)
	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:OnProcessAttack(unit, spell)

	if unit == nil then
		return
	end

	local target = spell.target

	if target and spell.name:find("BasicAttack") and self.ProjectileSpeed[unit.charName] then

		if target.networkID < 100 and self.PredictionDamage[target.networkID] == nil then
			self.PredictionDamage[target.networkID] = {}
		end

		if self.PredictionDamage[target.networkID] then

			local ctime = os.clock()+GetDistance(target, unit)/self.ProjectileSpeed[unit.charName]-GetLatency()/1000

			self.PredictionDamage[target.networkID][ctime] = self:GetAADmg(target, unit)
		end

	end

end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:OnProcessSpell(unit, spell)

	if unit == nil then
		return
	end

	if unit.networkID == myHero.networkID then

		if spell.name == "PowerFist" then
			--Temp self:ResetAA()
		else
			--print("Proc: " .. spell.name)
		end

	end

end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:GetHealth(unit, time)

	local health = unit.health

	if self.PredictionDamage[unit.networkID] then

		local Delete = true

		for ctime, damage in pairs(self.PredictionDamage[unit.networkID]) do

			if os.clock() < ctime then
				Delete = false
				break
			end

		end

		if Delete then
			self.PredictionDamage[unit.networkID] = nil
		else

			for ctime, damage in pairs(self.PredictionDamage[unit.networkID]) do

				if os.clock() >= ctime then
					self.PredictionDamage[unit.networkID][ctime] = nil
				elseif os.clock()+time > ctime+0.07 then
					health = health-damage
				end

			end

		end

	end

	return health
end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:GetAADmg(unit, attacker)

	local Armor = math.max(0, unit.armor*attacker.armorPenPercent-attacker.armorPen)
	local ArmorPercent = Armor/(100+Armor)
	local TrueDmg = attacker.totalDamage*(1-ArmorPercent)

	return TrueDmg
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Blitzcrank:OnUpdateBuff(unit, buff, stacks)

	if unit == nil or buff == nil then
		return
	end

	if unit.networkID == myHero.networkID then

		if buff.name == "recall" then
			self.IsRecall = true
		else
			--print("Update: " .. buff.name)
		end

	else

		if buff.name == "rocketgrab2" and unit.type == myHero.type then

			if self.Menu.Misc.GrabE then
				self:CastE(unit)
			end

		end

	end

end

---------------------------------------------------------------------------------

function HTTF_Blitzcrank:OnRemoveBuff(unit, buff)

	if unit == nil or buff == nil then
		return
	end

	if unit.networkID == myHero.networkID then

		if buff.name == "recall" then
			self.IsRecall = false
		else
			--print("Remove: " .. buff.name)
		end

	end

end
