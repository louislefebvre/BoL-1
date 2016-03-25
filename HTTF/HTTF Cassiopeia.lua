local Version = 2.11
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

if myHero.charName ~= "Cassiopeia" then
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
class("HTTF_Cassiopeia")

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:ScriptMsg(msg)
	print("<font color=\"#DAA520\"><b>[HTTF Cassiopeia]</b></font>  <font color=\"#FFFFFF\">" .. msg .. "</font>")
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:ErrorMsg(msg)
	print("<font color=\"#DAA520\"><b>[HTTF Cassiopeia]</b></font>  <font color=\"#FF0000\">" .. msg .. "</font>")
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
		DrawText('Download Status: ' .. (self.DownloadStatus or 'Unknown'), 50, 10, 50,ARGB(0xFF, 0xFF, 0xFF, 0xFF))
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

		for i=8, 1, -1 do
			r=r .. (b%2^i-b%2^(i-1)>0 and '1' or '0')
		end

		return r;
	end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(x)

		if (#x < 6) then
			return ''
		end

		local c=0

		for i = 1, 6 do
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

			self.DownloadStatus = 'Downloading VersionInfo (' .. math.round(100/self.Size*DownloadedSize, 2) .. '%)'
		end

	end

	if self.File:find('</scr' .. 'ipt>') then
		self.DownloadStatus = 'Downloading VersionInfo (100%)'

		local a,b = self.File:find('\r\n\r\n')

		self.File = self.File:sub(a, -1)
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

			self.DownloadStatus = 'Downloading Script (' .. math.round(100/self.Size*DownloadedSize, 2) .. '%)'
		end

	end

	if self.File:find('</scr' .. 'ipt>') then
		self.DownloadStatus = 'Downloading Script (100%)'

		local a,b = self.File:find('\r\n\r\n')

		self.File = self.File:sub(a, -1)
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

	local H = HTTF_Cassiopeia()

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:__init()
	self:Update()
	self:Variables()
	self:Menu()
	
	AddTickCallback(function() self:OnTick() end)
	AddDrawCallback(function() self:OnDraw() end)
	
	AddAnimationCallback(function(...) self:OnAnimation(...) end)
	AddProcessAttackCallback(function(...) self:OnProcessAttack(...) end)
	AddProcessSpellCallback(function(...) self:OnProcessSpell(...) end)
	--AddUpdateBuffCallback(function(...) self:OnUpdateBuff(...) end)
	--AddRemoveBuffCallback(function(...) self:OnRemoveBuff(...) end)
	--AddRecvPacketCallback2(function(p) self:OnRecvPacket(p) end)
	--AddSendPacketCallback(function(p) self:OnSendPacket(p) end)
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:Update()

	local Script = {}

	Script.Host = "raw.githubusercontent.com"
	Script.VersionPath = "/BolHTTF/BoL/master/HTTF/Version/HTTF%20Cassiopeia.version"
	Script.Path = "/BolHTTF/BoL/master/HTTF/HTTF%20Cassiopeia.lua"
	Script.SavePath = SCRIPT_PATH .. FileName
	Script.CallbackUpdate = function(NewVersion, OldVersion) self:ScriptMsg("Updated to " .. NewVersion) end
	Script.CallbackNoUpdate = function(OldVersion) self:ScriptMsg("No Updates Found") end
	Script.CallbackNewVersion = function(NewVersion) self:ScriptMsg("New Version found (" .. NewVersion .. "). Please wait until its downloaded") end
	Script.CallbackError = function(NewVersion) self:ScriptMsg("Error while Downloading. Please try again") end
	ScriptUpdate(Version, true, Script.Host, Script.VersionPath, Script.Path, Script.SavePath, Script.CallbackUpdate,Script.CallbackNoUpdate, Script.CallbackNewVersion,Script.CallbackError)
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:Variables()
	self.GuardianAngleMemory = {}

	self.SaveAttack = _G.myHero.Attack
	self.SaveMove = _G.myHero.MoveTo

	self.Move = {able = true}

	self.AA = {able = true}
	self.Q = {delay = 0.7, radius = 200, range = 850}
	self.W = {delay = 0.25, radius = 300, range = 850, speed = 2500}
	self.E = {delay = 0.15, range = 700, speed = 1900}
	self.R = {range = 825}

	self.LastE = 0

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

	self.TS = TargetSelector(TARGET_LESS_CAST, self.Q.range, DAMAGE_MAGIC, false)

	self.EnemyHeroes = GetEnemyHeroes()
	self.EnemyMinions = minionManager(MINION_ENEMY, self.Q.range, myHero, MINION_SORT_MAXHEALTH_DEC)
	self.JungleMobs = minionManager(MINION_JUNGLE, self.Q.range+300, myHero, MINION_SORT_MAXHEALTH_DEC)
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:Menu()

	self.Menu = scriptConfig("HTTF Cassiopeia", "HTTF Cassiopeia")

	self.Menu:addSubMenu("Combo Settings", "Combo")
		self.Menu.Combo:addParam("On", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
		self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Combo:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Combo:addParam("QMP", "If Mana Percent >= x", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
		self.Menu.Combo:addParam("QNP", "Only if Target isn't poisoned", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Combo:addParam("UseW", "Use W", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Combo:addParam("WMP", "If Mana Percent >= x", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
		self.Menu.Combo:addParam("WNP", "Only if Target isn't poisoned", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Combo:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Combo:addParam("EMP", "If Mana Percent >= x", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
		self.Menu.Combo:addParam("EKS", "KS even if Target isn't poisoned", SCRIPT_PARAM_ONOFF, false)

		self.Menu.Combo:addSubMenu("Ulti", "Ulti")
			self.Menu.Combo.Ulti:addParam("UseRS", "Use R (Single Target)", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Combo.Ulti:addParam("RDmg", "If Full Dmg >= Target Health * x", SCRIPT_PARAM_SLICE, 100, 50, 150, 0)
			self.Menu.Combo.Ulti:addParam("RSave", "Save R if Killable with Combo", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Combo.Ulti:addParam("RNoE", "Combo - The number of E", SCRIPT_PARAM_SLICE, 4, 1, 6, 0)
			--[[self.Menu.Combo.Ulti:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Combo.Ulti:addParam("UseRM", "Use R (Multiple Target)", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Combo.Ulti:addParam("RMin", "If Enemy Count >= x", SCRIPT_PARAM_SLICE, 3, 2, 5, 0)]]
			
		--[[self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Combo:addParam("UseItem", "Use Item", SCRIPT_PARAM_ONOFF, true)]]
		
	self.Menu:addSubMenu("Harass Settings", "Harass")
		self.Menu.Harass:addParam("On", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('C'))
		self.Menu.Harass:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Harass:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Harass:addParam("QMP", "If Mana Percent >= x", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
		self.Menu.Harass:addParam("QNP", "Only if Target isn't poisoned", SCRIPT_PARAM_ONOFF, false)
		self.Menu.Harass:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Harass:addParam("UseW", "Use W", SCRIPT_PARAM_ONOFF, false)
		self.Menu.Harass:addParam("WMP", "If Mana Percent >= x", SCRIPT_PARAM_SLICE, 80, 0, 100, 0)
		self.Menu.Harass:addParam("WNP", "Only if Target isn't poisoned", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Harass:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Harass:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Harass:addParam("EMP", "If Mana Percent >= x", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
		self.Menu.Harass:addParam("EKS", "KS even if Target isn't poisoned", SCRIPT_PARAM_ONOFF, true)
		
		--[[self.Menu.Harass:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Harass:addParam("UseItem", "Use Item", SCRIPT_PARAM_ONOFF, true)]]
		
	self.Menu:addSubMenu("KillSteal Settings", "KillSteal")
		self.Menu.KillSteal:addParam("On", "KillSteal", SCRIPT_PARAM_ONOFF, true)
		self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.KillSteal:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.KillSteal:addParam("UseW", "Use W", SCRIPT_PARAM_ONOFF, false)
		self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.KillSteal:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, true)
		self.Menu.KillSteal:addParam("EKS", "Even if Target isn't poisoned", SCRIPT_PARAM_ONOFF, false)
		self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.KillSteal:addParam("UseR", "Use R", SCRIPT_PARAM_ONOFF, true)
		self.Menu.KillSteal:addParam("RSave", "Save R if Killable with QWE", SCRIPT_PARAM_ONOFF, true)
		self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.KillSteal:addParam("Smart", "Smart KillSteal", SCRIPT_PARAM_ONOFF, true)
		self.Menu.KillSteal:addParam("SmartNoE", "Smart KS - The number of E", SCRIPT_PARAM_SLICE, 4, 1, 6, 0)
		if self.Ignite ~= nil then
		self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.KillSteal:addParam("UseIgnite", "Use Ignite", SCRIPT_PARAM_ONOFF, true)
		self.Menu.KillSteal:addParam("IgniteEarly", "Early casting", SCRIPT_PARAM_ONOFF, true)
		self.Menu.KillSteal:addParam("IgniteSave", "Save Ignite if Killable with Spells", SCRIPT_PARAM_ONOFF, true)
		end
		
	self.Menu:addSubMenu("Clear Settings", "Clear")
	
		self.Menu.Clear:addSubMenu("Lane Clear Settings", "Farm")
			self.Menu.Clear.Farm:addParam("On", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('V'))
			self.Menu.Clear.Farm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Clear.Farm:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Clear.Farm:addParam("QMP", "If Mana Percent >= x", SCRIPT_PARAM_SLICE, 60, 0, 100, 0)
			self.Menu.Clear.Farm:addParam("QMin", "If Min Minion Count >= x", SCRIPT_PARAM_SLICE, 3, 1, 6, 0)
			self.Menu.Clear.Farm:addParam("QNP", "Only if Target isn't poisoned", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Clear.Farm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Clear.Farm:addParam("UseW", "Use W", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Clear.Farm:addParam("WMP", "If Mana Percent >= x", SCRIPT_PARAM_SLICE, 60, 0, 100, 0)
			self.Menu.Clear.Farm:addParam("WMin", "If Min Minion Count >= x", SCRIPT_PARAM_SLICE, 4, 1, 6, 0)
			self.Menu.Clear.Farm:addParam("WNP", "Only if Target isn't poisoned", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Clear.Farm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Clear.Farm:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Clear.Farm:addParam("EMP", "If Mana Percent >= x (Clear)", SCRIPT_PARAM_SLICE, 70, 0, 100, 0)
			self.Menu.Clear.Farm:addParam("ENP", "Even if Target isn't poisoned (MP < x)", SCRIPT_PARAM_SLICE, 70, 0, 100, 0)
			
		self.Menu.Clear:addSubMenu("Jungle Clear Settings", "JFarm")
			self.Menu.Clear.JFarm:addParam("On", "Jungle Clear", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('V'))
			self.Menu.Clear.JFarm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Clear.JFarm:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Clear.JFarm:addParam("QMP", "If Mana Percent >= x", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
			self.Menu.Clear.JFarm:addParam("QNP", "Only if Target isn't poisoned", SCRIPT_PARAM_ONOFF, false)
			self.Menu.Clear.JFarm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Clear.JFarm:addParam("UseW", "Use W", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Clear.JFarm:addParam("WMP", "If Mana Percent >= x", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
			self.Menu.Clear.JFarm:addParam("WMin", "If Min JungleMob Count >= x", SCRIPT_PARAM_SLICE, 2, 1, 4, 0)
			self.Menu.Clear.JFarm:addParam("WNP", "Only if Target isn't poisoned", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Clear.JFarm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Clear.JFarm:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Clear.JFarm:addParam("EMP", "If Mana Percent >= x (Clear)", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
			
		--[[self.Menu.Clear:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Clear:addParam("UseItem", "Use Item", SCRIPT_PARAM_ONOFF, true)]]
		
	self.Menu:addSubMenu("LastHit Settings", "LastHit")
		self.Menu.LastHit:addParam("On", "LastHit", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('X'))
		self.Menu.LastHit:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.LastHit:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		self.Menu.LastHit:addParam("QMP", "if Mana Percent >= x", SCRIPT_PARAM_SLICE, 70, 0, 100, 0)
		self.Menu.LastHit:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.LastHit:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, true)
		self.Menu.LastHit:addParam("ENP", "Even if Target isn't poisoned", SCRIPT_PARAM_SLICE, 70, 0, 100, 0)
		
	self.Menu:addSubMenu("Flee Settings", "Flee")
		self.Menu.Flee:addParam("On", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('G'))
		self.Menu.Flee:addParam("UseE", "Use E if Target is poisoned", SCRIPT_PARAM_ONOFF, true)
		
	self.Menu:addSubMenu("Misc", "Misc")
		--[[self.Menu.Misc:addParam("BlockR", "Block R if not hit", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Misc:addParam("Blank", "", SCRIPT_PARAM_INFO, "")]]
		self.Menu.Misc:addParam("EDelay", "E Casting Delay", SCRIPT_PARAM_SLICE, 0.5, 0.5, 1, 2)
		self.Menu.Misc:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Misc:addParam("STarget", "Combo - Attack selected target (T)", SCRIPT_PARAM_ONOFF, false)
		self.Menu.Misc:addParam("SRange", "Combo - Select range (1050)", SCRIPT_PARAM_SLICE, 1050, 850, 1250, -1)
		
	self.Menu:addSubMenu("Draw Settings", "Draw")
		self.Menu.Draw:addParam("On", "Draw", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Draw:addParam("Lfc", "Draw Lag free circles", SCRIPT_PARAM_ONOFF, false)
		self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Draw:addParam("Target", "Draw Target", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Draw:addParam("AA", "Draw Attack range", SCRIPT_PARAM_ONOFF, false)
		self.Menu.Draw:addParam("Q", "Draw Q range", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Draw:addParam("W", "Draw W range", SCRIPT_PARAM_ONOFF, false)
		self.Menu.Draw:addParam("E", "Draw E range", SCRIPT_PARAM_ONOFF, false)
		self.Menu.Draw:addParam("R", "Draw R range", SCRIPT_PARAM_ONOFF, true)
		if self.Ignite ~= nil then
		self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Draw:addParam("I", "Draw Ignite range", SCRIPT_PARAM_ONOFF, false)
		end
		self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
		self.Menu.Draw:addParam("ComboDamage", "Draw Combo Damage", SCRIPT_PARAM_ONOFF, true)

	self.Menu:addSubMenu("Prediction Settings", "Prediction")

		if not VIP_USER then
			self.Menu.Prediction:addParam("Choice", "Choose Prediction", SCRIPT_PARAM_LIST, 1, {"HPrediction"})

			if self.Menu.Prediction.Choice == 2 then
				self.Menu.Prediction.Choice = 1
			end

		else
			self.Menu.Prediction:addParam("Choice", "Choose Prediction", SCRIPT_PARAM_LIST, 1, {"HPrediction", "KPrediction"})
		end

		self.Menu.Prediction:addSubMenu("HitChance - HPrediction", "HPrediction")
			self.Menu.Prediction.HPrediction:addParam("ComboQ", "Combo - Q HitChacne (1)", SCRIPT_PARAM_SLICE, 1, 1, 3, 1)
			self.Menu.Prediction.HPrediction:addParam("HarassQ", "Harass - Q HitChacne (2)", SCRIPT_PARAM_SLICE, 2, 1, 3, 1)
			self.Menu.Prediction.HPrediction:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Prediction.HPrediction:addParam("ComboW", "Combo - W HitChacne (2.2)", SCRIPT_PARAM_SLICE, 2.2, 1, 3, 1)
			self.Menu.Prediction.HPrediction:addParam("HarassW", "Harass - W HitChacne (2.6)", SCRIPT_PARAM_SLICE, 2.6, 1, 3, 1)
			self.Menu.Prediction.HPrediction:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Prediction.HPrediction:addParam("ComboR", "Combo - R HitChacne (3)", SCRIPT_PARAM_SLICE, 3, 1, 3, 1)

		self.Menu.Prediction:addSubMenu("HitChance - KPrediction", "KPrediction")
			self.Menu.Prediction.KPrediction:addParam("ComboQ", "Combo - Q HitChacne (1)", SCRIPT_PARAM_SLICE, 1, 1, 4, 1)
			self.Menu.Prediction.KPrediction:addParam("HarassQ", "Harass - Q HitChacne (2)", SCRIPT_PARAM_SLICE, 2, 1, 4, 1)
			self.Menu.Prediction.KPrediction:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Prediction.KPrediction:addParam("ComboW", "Combo - W HitChacne (2.2)", SCRIPT_PARAM_SLICE, 2.2, 1, 4, 1)
			self.Menu.Prediction.KPrediction:addParam("HarassW", "Harass - W HitChacne (2.6)", SCRIPT_PARAM_SLICE, 2.6, 1, 4, 1)
			self.Menu.Prediction.KPrediction:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
			self.Menu.Prediction.KPrediction:addParam("ComboR", "Combo - R HitChacne (3)", SCRIPT_PARAM_SLICE, 3, 1, 4, 1)

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
	
	self.TS.name = "QWE"
	self.Menu:addTS(self.TS)
	
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

function HTTF_Cassiopeia:LoadOrbwalker(choice)

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
					_Pewalk.DisableSkillFarm(_Q) _Pewalk.DisableSkillFarm(_W) _Pewalk.DisableSkillFarm(_E) _Pewalk.DisableSkillFarm(_R)
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

function HTTF_Cassiopeia:UnloadOrbwalker()

	if self.SACLoaded or self.NOWLoaded or self.POWLoaded then
		self:ScriptMsg("Press F9 twice to unload the Orbwalker")
	end

end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:EnableAttack()
	_G.myHero.Attack = self.SaveAttack
	self.AA.able = true
end

function HTTF_Cassiopeia:DisableAttack()
	_G.myHero.Attack = function() end
	self.AA.able = false
end

function HTTF_Cassiopeia:EnableMove()
	_G.myHero.MoveTo = self.SaveMove
end

function HTTF_Cassiopeia:DisableMove()
	_G.myHero.MoveTo = function() end
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:LoadPrediction(choice)

	if choice == 1 and not self.HPred then

		if _G.HPrediction_Init then
			self.HPred = HPrediction()
			self.Menu.Prediction:addParam("Info", "HPrediction is detected", SCRIPT_PARAM_INFO, "")
		else

			local function UpdateHPred()

				if FileExist(LIB_PATH .. "HPrediction.lua") then
					require("HPrediction")
					self.HPred = HPrediction()
					self.Menu.Prediction:addParam("Info", "HPrediction is detected", SCRIPT_PARAM_INFO, "")
				else
					DownloadFile("https://raw.githubusercontent.com/BolHTTF/BoL/master/HTTF/Common/HPrediction.lua", LIB_PATH .. "HPrediction.lua", function() UpdateHPred() end)
				end

			end

			UpdateHPred()
		end

	elseif choice == 2 and not self.KPred then

		if _G.KPrediction_Init then
			self.KPred = KPrediction()
			self.Menu.Prediction:addParam("Info", "KPrediction is detected", SCRIPT_PARAM_INFO, "")
		else

			local function UpdateKPred()

				if FileExist(LIB_PATH .. "KPrediction.lua") then
					require("KPrediction")
					self.KPred = KPrediction()
					self.Menu.Prediction:addParam("Info", "KPrediction is detected", SCRIPT_PARAM_INFO, "")
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

function HTTF_Cassiopeia:Level(spell)
	return myHero:GetSpellData(spell).level
end

function HTTF_Cassiopeia:Ready(spell)
	return spell and myHero:CanUseSpell(spell) == READY
end

function HTTF_Cassiopeia:Mana(spell)

	if spell == _Q then
		return 10*self:Level(spell)+30
	elseif spell == _W then
		return 10*self:Level(spell)+30
	elseif spell == _E then
		return 10*self:Level(spell)+40
	elseif spell == _R then
		return 100
	end
	
end

function HTTF_Cassiopeia:ItemReady(item)

	for i=ITEM_1, ITEM_6 do
	
		if (item == "Tiamat" or item == "Hydra") and myHero:GetSpellData(i).name == "ItemTiamatCleave" or item == "Titanic" and myHero:GetSpellData(i).name == "ItemTitanicHydraCleave" or item == "Youmu" and myHero:GetSpellData(i).name == "YoumusBlade" then
			return myHero:CanUseSpell(i) == READY
		end
		
	end
	
	return false
end

function HTTF_Cassiopeia:HasItem(item)

	for i=ITEM_1, ITEM_6 do
	
		if (item == "Tiamat" or item == "Hydra") and myHero:GetSpellData(i).name == "ItemTiamatCleave" or item == "Titanic" and myHero:GetSpellData(i).name == "ItemTitanicHydraCleave" or item == "Youmu" and myHero:GetSpellData(i).name == "YoumusBlade" then
			return true
		end
		
	end
	
	return false
end

function HTTF_Cassiopeia:IsPoisoned(unit, time)

	for i=1, unit.buffCount do
	
		local buff = unit:getBuff(i)
		
		if buff and buff.name and (buff.name == "cassiopeianoxiousblastpoison" or buff.name == "cassiopeiamiasmapoison" or buff.name == "poisontrailtarget" or buff.name == "s5junglemushroompoison" or buff.name == "toxicshotparticle" or buff.name == "twitchdeadlyvenom") and (GetGameTimer()+(time or 0) <= buff.endT) then 
			return true
		end
		
	end
	
	return false
end

function HTTF_Cassiopeia:GetNoE(unit)

	local buff_endT
	local TimeToEnd = 0
	
	for i=1, unit.buffCount do
	
		local buff = unit:getBuff(i)
		
		if buff and buff.name and (buff.name == "cassiopeianoxiousblastpoison" or buff.name == "cassiopeiamiasmapoison" or buff.name == "poisontrailtarget" or buff.name == "s5junglemushroompoison" or buff.name == "toxicshotparticle" or buff.name == "twitchdeadlyvenom") and (GetGameTimer() <= buff.endT) then
			buff_endT = buff_endT and math.max(buff_endT, buff.endT) or buff.endT
		end
		
	end
	
	if buff_endT then
		TimeToEnd = buff_endT-GetGameTimer()-GetLatency()/1000
	end
	
	return math.ceil(2*TimeToEnd)+1
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:ManaPercent()
	return (myHero.mana/myHero.maxMana)*100
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:AddRange(unit)
	return unit.boundingRadius
end

function HTTF_Cassiopeia:TrueRange(enemy)
	return myHero.range+self:AddRange(myHero)+self:AddRange(enemy)
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:IsInvulnerable(unit, time)

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

function HTTF_Cassiopeia:IsShielding(enemy, time)

	if enemy and enemy.valid and enemy.team ~= myHero.team and not enemy.dead then
	
		for i=1, enemy.buffCount do
		
			local buff = enemy:getBuff(i)
			
			if buff and buff.name and (buff.name == "SivirE") and (GetGameTimer()+(time or 0) <= buff.endT) then 
				return true
			end
			
		end
		
	end
	
	return false
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:IsValid(unit, distance, time)
	return unit ~= nil and unit.valid and unit.visible and not unit.dead and (distance == nil or GetDistanceSqr(unit) <= distance*distance) and (time == nil or self:IsTargetable(unit, time) and not self:IsInvulnerable(unit, time))
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:OnTick()

	if Debug then
		self:Debug()
	end
	
	if myHero.dead then
		return
	end
	
	for i, minion in ipairs(self.EnemyMinions.objects) do
	
		if self.PredictionDamage[minion.networkID] then
		
			local Delete = true
			
			for ctime, damage in pairs(self.PredictionDamage[minion.networkID]) do
			
				if (os.clock() < ctime) then
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
	
		if self.SMenu.JSteal.On or self.SMenu.JSteal.On2 then
			self:JSteal()
		end
		
		if self.SMenu.KillSteal.On then
			self:SKillSteal()
		end
		
		self:JStealAlways()
	end
	
	--[[if self.Menu.Auto.On then
		self:Auto()
	end]]
	
	self:Targets()
	
	self:BlockAA()
	
	if self.AA.able == false then
		self:MoveToMouse()
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

function HTTF_Cassiopeia:Debug()

	for i=ITEM_1, ITEM_6 do
	
		if myHero:GetSpellData(i) and myHero:GetSpellData(i).name ~= "BaseSpell" then
			print("(" .. i .. "): " .. myHero:GetSpellData(i).name)
		end
		
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:Targets()
	self.EnemyMinions:update()
	self.JungleMobs:update()
	
	local T = GetTarget()
	
	if T and T.type == myHero.type and T.team ~= myHero.team then
		self.STarget = T
		
		if self.Menu.Misc.STarget and ValidTarget(T, self.Menu.Misc.SRange) then
			self.Target = T
			return
		end
		
	else
		self.STarget = nil
	end
	
	self.TS:update()
	self.Target = self.TS.target
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:BlockAA()

	if self:Level(_E) >= 1 and (GetSpellData(_E).currentCd <= 0.5) and myHero.mana > self:Mana(_E) then
	
		if self.Target and not self.Target.dead and self:IsPoisoned(self.Target) and not self:IsInvulnerable(self.Target) then
		
			if self.Menu.Combo.On and self.Menu.Combo.UseE and (self:ManaPercent() >= self.Menu.Combo.EMP) then
				self:DisableAttack()
				return
			end
			
			if self.Menu.Harass.On and self.Menu.Harass.UseE and (self:ManaPercent() >= self.Menu.Harass.EMP) then
				self:DisableAttack()
				return
			end
			
		end
		
		if self.Menu.KillSteal.On and self.Menu.KillSteal.UseE then
		
			for i, hero in ipairs(self.EnemyHeroes) do
			
				local PH_H = self:PredictHealth(hero, self.E.delay+GetDistance(hero)/(self.E.speed+hero.ms))
				
				local E_HeroDmg = self:GetDmg("E", hero)
				
				if not hero.dead and (E_HeroDmg >= PH_H) and (self.Menu.KillSteal.EKS or self:IsPoisoned(hero)) and not self:IsInvulnerable(hero) and ValidTarget(hero, self.E.range) then
					self:DisableAttack()
					return
				end
				
			end
			
		end
		
		if self.Menu.Clear.Farm.On and self.Menu.Clear.Farm.UseE then
		
			for i, minion in ipairs(self.EnemyMinions.objects) do
			
				local PH_L = self:PredictHealth(minion, self.E.delay+GetDistance(minion)/self.E.speed)
				local PH_H = self:PredictHealth(minion, self.E.delay+GetDistance(minion)/(self.E.speed+minion.ms))
				
				local EMinionDmg = self:GetDmg("E", minion)
				
				if (PH_L > 0) and ((EMinionDmg >= PH_H) or (self:ManaPercent() >= self.Menu.Clear.Farm.EMP) or minion.charName == "SRU_OrderMinionSuper" or minion.charName == "SRU_ChaosMinionSuper") and self:IsPoisoned(minion) and ValidTarget(minion, self.E.range) then
					self:DisableAttack()
					return
				end
				
			end
			
		end
		
		if self.Menu.Clear.JFarm.On and self.Menu.Clear.JFarm.UseE and (self:ManaPercent() >= self.Menu.Clear.JFarm.EMP) then
		
			local LargeJunglemob
			
			for i, junglemob in ipairs(self.JungleMobs.objects) do
			
				for j = 1, #self.FocusJungleNames do
				
					if junglemob.name == self.FocusJungleNames[j] then
						LargeJunglemob = junglemob
						break
						break
					end
					
				end
				
			end
			
			if LargeJunglemob then
			
				if self:IsPoisoned(LargeJunglemob) and ValidTarget(LargeJunglemob, self.E.range) then
					self:DisableAttack()
					return
				end
				
			else
			
				for i, junglemob in ipairs(self.JungleMobs.objects) do
				
					if self:IsPoisoned(junglemob) and ValidTarget(junglemob, self.E.range) then
						self:DisableAttack()
						return
					end
					
				end
				
			end
			
		end
		
		if self.Menu.LastHit.On and self.Menu.LastHit.UseE then
		
			for i, minion in ipairs(self.EnemyMinions.objects) do
			
				local PH_L = self:PredictHealth(minion, self.E.delay+GetDistance(minion)/self.E.speed)
				local PH_H = self:PredictHealth(minion, self.E.delay+GetDistance(minion)/(self.E.speed+minion.ms))
				
				local E_MinionDmg = self:GetDmg("E", minion)
				
				if (PH_L > 0) and (E_MinionDmg >= PH_H) and self:IsPoisoned(minion) and ValidTarget(minion, self.E.range) then
					self:DisableAttack()
					return
				end
				
			end
			
		end
		
	end
	
	self:EnableAttack()
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:Combo()

	local UseQ = self.Menu.Combo.UseQ
	local QMP = self.Menu.Combo.QMP
	local QNP = self.Menu.Combo.QNP
	
	local UseW = self.Menu.Combo.UseW
	local WMP = self.Menu.Combo.WMP
	local WNP = self.Menu.Combo.WNP
	
	local UseE = self.Menu.Combo.UseE
	local EMP = self.Menu.Combo.EMP
	local EKS = self.Menu.Combo.EKS
	
	local UseRS = self.Menu.Combo.Ulti.UseRS
	local RDmg = self.Menu.Combo.Ulti.RDmg
	local RSave = self.Menu.Combo.Ulti.RSave
	local RNoE = math.min(math.floor(3/self.Menu.Misc.EDelay), self.Menu.Combo.Ulti.RNoE)
	--local UseRM = self.Menu.Combo.Ulti.UseRM
	
	--local UseItem = self.Menu.Combo.UseItem
	
---------------------------------------------------------------------------------
	--Item
	--[[if self.Target and UseItem then
	
		if self:ItemReady("Youmu") and not self:CanAA() and ValidTarget(self.Target, self:TrueRange(self.Target)) then
			self:CastItem(self.Target, "Youmu")
		end
		
	end]]
	
---------------------------------------------------------------------------------
	--R
	if self:Ready(_R) then
	
		if UseRS and self.Target and ValidTarget(self.Target, self.R.range) then
		
			local QPos, QHitChance
			local WPos, WHitChance
			
			if self.Menu.Prediction.Choice == 1 and self.HPred then
				QPos, QHitChance = self.HPred:GetPredict(self.HPred.Presets["Cassiopeia"]["Q"], self.Target, myHero)
				WPos, WHitChance = self.HPred:GetPredict(self.HPred.Presets["Cassiopeia"]["W"], self.Target, myHero)
			elseif self.Menu.Prediction.Choice == 2 and self.KPred then
				QPos, QHitChance = self.KPred:GetPrediction(self.KPred.Presets["Cassiopeia"]["Q"], self.Target, myHero)
				WPos, WHitChance = self.KPred:GetPrediction(self.KPred.Presets["Cassiopeia"]["W"], self.Target, myHero)
			end

			local Q_TargetDmg = UseQ and self:Ready(_Q) and (self:ManaPercent() >= QMP) and ValidTarget(self.Target, self.Q.range) and self:GetDmg("Q", self.Target) or 0
			local Q_TargetDmg_2 = UseQ and self:Ready(_Q) and (self:ManaPercent() >= QMP) and (QHitChance >= 2) and ValidTarget(self.Target, self.Q.range) and self:GetDmg("Q", self.Target) or 0
			local W_TargetDmg = UseW and self:Ready(_W) and (self:ManaPercent() >= WMP) and ValidTarget(self.Target, self.W.range) and self:GetDmg("W", self.Target) or 0
			local W_TargetDmg_2 = UseW and self:Ready(_W) and (self:ManaPercent() >= WMP) and (WHitChance >= 2) and ValidTarget(self.Target, self.W.range) and self:GetDmg("W", self.Target) or 0
			local E_TargetDmg = UseE and (GetSpellData(_E).currentCd <= 0.5) and (self:ManaPercent() >= EMP) and self:IsPoisoned(self.Target) and ValidTarget(self.Target, self.E.range) and self:GetDmg("E", self.Target) or 0
			local R_TargetDmg = self:GetDmg("R", self.Target)
			
			local Mana = (Q_TargetDmg_2 ~= 0 and self:Mana(_Q) or 0)+(W_TargetDmg_2 ~= 0 and self:Mana(_W) or 0)+(E_TargetDmg ~= 0 and RNoE*self:Mana(_E) or 0)+self:Mana(_R)
			
			if (myHero.mana >= Mana) and (not RSave or (Q_TargetDmg+W_TargetDmg+RNoE*E_TargetDmg < self.Target.health)) and (R_TargetDmg+Q_TargetDmg_2+W_TargetDmg_2+RNoE*E_TargetDmg >= self.Target.health*(RDmg/100)) then
				self:CastR(self.Target, "Combo_S")
			end
			
		end
		
		--[[if UseRM then
		
			for i, hero in ipairs(self.EnemyHeroes) do
			
				if ValidTarget(hero, self.R.range) then
					self:CastR(hero, "Combo_M")
				end
				
			end
			
		end]]
		
	end
	
---------------------------------------------------------------------------------
	
	if self.Target == nil then
		return
	end
	
---------------------------------------------------------------------------------
	--E
	if UseE and self:Ready(_E) and (self:ManaPercent() >= EMP) and ValidTarget(self.Target, self.E.range) then
	
		if self:IsPoisoned(self.Target) then
			self:CastE(self.Target)
		elseif EKS then
		
			local PH_H = self:PredictHealth(self.Target, self.E.delay+GetDistance(self.Target)/(self.E.speed+self.Target.ms))
			
			local E_TargetDmg = self:GetDmg("E", self.Target)
			
			if (E_TargetDmg >= PH_H) then
				self:CastE(self.Target)
			end
			
		end
		
	end
	
---------------------------------------------------------------------------------
	--Q
	if UseQ and self:Ready(_Q) and (self:ManaPercent() >= QMP) and ValidTarget(self.Target, self.Q.range) then
	
		if not QNP or not self:IsPoisoned(self.Target, self.Q.delay) then
			self:CastQ(self.Target, "Combo")
		end
		
	end
	
---------------------------------------------------------------------------------
	--W
	if UseW and self:Ready(_W) and (self:ManaPercent() >= WMP) and ValidTarget(self.Target, self.W.range) then
	
		if not WNP or not self:IsPoisoned(self.Target, self.W.delay+GetDistance(self.Target)/(self.W.speed+self.Target.ms)) then
			self:CastW(self.Target, "Combo")
		end
		
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:Harass()

	local UseQ = self.Menu.Harass.UseQ
	local QDmg = self.Menu.Harass.QDmg
	local QMP = self.Menu.Harass.QMP
	local QNP = self.Menu.Harass.QNP
	
	local UseW = self.Menu.Harass.UseW
	local WMP = self.Menu.Harass.WMP
	local WNP = self.Menu.Harass.WNP
	
	local UseE = self.Menu.Harass.UseE
	local EMP = self.Menu.Harass.EMP
	local EKS = self.Menu.Harass.EKS
	
	--local UseItem = self.Menu.Harass.UseItem
	
---------------------------------------------------------------------------------
	--Item
	--[[if self.Target and UseItem then
		
	end]]
	
---------------------------------------------------------------------------------
	
	if self.Target == nil then
		return
	end
	
---------------------------------------------------------------------------------
	--E
	if UseE and self:Ready(_E) and (self:ManaPercent() >= EMP) and ValidTarget(self.Target, self.E.range) then
	
		if self:IsPoisoned(self.Target) then
			self:CastE(self.Target)
		elseif EKS then
		
			local PH_H = self:PredictHealth(self.Target, self.E.delay+GetDistance(self.Target)/(self.E.speed+self.Target.ms))
			
			local E_TargetDmg = self:GetDmg("E", self.Target)
			
			if (E_TargetDmg >= PH_H) then
				self:CastE(self.Target)
			end
			
		end
		
	end
	
---------------------------------------------------------------------------------
	--Q
	if UseQ and self:Ready(_Q) and (self:ManaPercent() >= QMP) and ValidTarget(self.Target, self.Q.range) then
	
		if not QNP or not self:IsPoisoned(self.Target, self.Q.delay) then
			self:CastQ(self.Target, "Harass")
		end
		
	end
	
---------------------------------------------------------------------------------
	--W
	if UseW and self:Ready(_W) and (self:ManaPercent() >= WMP) and ValidTarget(self.Target, self.W.range) then
	
		if not WNP or not self:IsPoisoned(self.Target, self.W.delay+GetDistance(self.Target)/(self.W.speed+self.Target.ms)) then
			self:CastW(self.Target, "Harass")
		end
		
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:KillSteal()

	local UseQ = self.Menu.KillSteal.UseQ
	local UseW = self.Menu.KillSteal.UseW
	
	local UseE = self.Menu.KillSteal.UseE
	local EKS = self.Menu.KillSteal.EKS
	
	local UseR = self.Menu.KillSteal.UseR
	local RSave = self.Menu.KillSteal.RSave
	
	local Smart = self.Menu.KillSteal.Smart
	local SmartNoE = math.min(math.floor(3/self.Menu.Misc.EDelay), self.Menu.KillSteal.SmartNoE)
	
	local UseIgnite = self.Ignite and self.Menu.KillSteal.UseIgnite or false
	local IgniteEarly = self.Ignite and self.Menu.KillSteal.IgniteEarly or false
	local IgniteSave = self.Ignite and self.Menu.KillSteal.IgniteSave or false
	
---------------------------------------------------------------------------------
	--QWER
	if Smart then
		
		local QPos, QHitChance
		local WPos, WHitChance
		local RPos, RHitChance

		for i, hero in ipairs(self.EnemyHeroes) do

			if self.Menu.Prediction.Choice == 1 and self.HPred then
				QPos, QHitChance = self.HPred:GetPredict(self.HPred.Presets["Cassiopeia"]["Q"], hero, myHero)
				WPos, WHitChance = self.HPred:GetPredict(self.HPred.Presets["Cassiopeia"]["W"], hero, myHero)
				RPos, RHitChance = self.HPred:GetPredict(self.HPred.Presets["Cassiopeia"]["R"], hero, myHero)
			elseif self.Menu.Prediction.Choice == 2 and self.KPred then
				QPos, QHitChance = self.KPred:GetPrediction(self.KPred.Presets["Cassiopeia"]["Q"], hero, myHero)
				WPos, WHitChance = self.KPred:GetPrediction(self.KPred.Presets["Cassiopeia"]["W"], hero, myHero)
				RPos, RHitChance = self.KPred:GetPrediction(self.KPred.Presets["Cassiopeia"]["R"], hero, myHero)
			end
			
			local Q_HeroDmg = UseQ and self:Ready(_Q) and ValidTarget(hero, self.Q.range) and self:GetDmg("Q", hero) or 0
			local Q_HeroDmg_2 = UseQ and self:Ready(_Q) and (QHitChance >= 2) and ValidTarget(hero, self.Q.range) and self:GetDmg("Q", hero) or 0
			local W_HeroDmg = UseW and self:Ready(_W) and ValidTarget(hero, self.W.range) and self:GetDmg("W", hero) or 0
			local W_HeroDmg_2 = UseW and self:Ready(_W) and (WHitChance >= 2) and ValidTarget(hero, self.W.range) and self:GetDmg("W", hero) or 0
			local E_HeroDmg = UseE and (GetSpellData(_E).currentCd <= 0.5) and self:IsPoisoned(hero) and ValidTarget(hero, self.E.range) and self:GetDmg("E", hero) or 0
			local R_HeroDmg = UseR and self:Ready(_R) and (not RSave or (Q_HeroDmg+W_HeroDmg+SmartNoE*E_HeroDmg < hero.health)) and ValidTarget(hero, self.R.range) and self:GetDmg("R", hero) or 0
			local R_HeroDmg_2 = UseR and self:Ready(_R) and (not RSave or (Q_HeroDmg+W_HeroDmg+SmartNoE*E_HeroDmg < hero.health)) and (RHitChance >= 2) and ValidTarget(hero, self.R.range) and self:GetDmg("R", hero) or 0
			local Ignite_HeroDmg = UseIgnite and self:Ready(self.Ignite) and (not IgniteSave or (Q_HeroDmg+W_HeroDmg+SmartNoE*E_HeroDmg+R_HeroDmg < hero.health)) and ((IgniteEarly and self:GetDmg("Ignite", hero)+Q_HeroDmg_2+W_HeroDmg_2+SmartNoE*E_HeroDmg+R_HeroDmg_2 or self:GetDmg("Ignite", hero)) >= hero.health) and ValidTarget(hero, self.I.range) and self:GetDmg("Ignite", hero) or 0
			
			local Mana = (Q_TargetDmg_2 ~= 0 and self:Mana(_Q) or 0)+(W_TargetDmg_2 ~= 0 and self:Mana(_W) or 0)+(E_TargetDmg ~= 0 and SmartNoE*self:Mana(_E) or 0)+(R_HeroDmg_2 ~= 0 and self:Mana(_R) or 0)
			
			if (myHero.mana >= Mana) and (Q_HeroDmg_2+W_HeroDmg_2+SmartNoE*E_HeroDmg+R_HeroDmg_2+Ignite_HeroDmg >= hero.health) and not self:IsInvulnerable(hero, self.Q.delay) and ValidTarget(hero, self.Q.range) then
			
				if UseIgnite and self:Ready(self.Ignite) and (not IgniteSave or (Q_HeroDmg+W_HeroDmg+SmartNoE*E_HeroDmg+R_HeroDmg < hero.health)) and ((IgniteEarly and Ignite_HeroDmg+Q_HeroDmg_2+W_HeroDmg_2+SmartNoE*E_HeroDmg+R_HeroDmg_2 or Ignite_HeroDmg) >= hero.health) and ValidTarget(hero, self.I.range) then
					self:CastIgnite(hero)
				end
				
				if UseR and self:Ready(_R) and (not RSave or (Q_HeroDmg+W_HeroDmg+SmartNoE*E_HeroDmg+Ignite_HeroDmg < hero.health)) and ValidTarget(hero, self.R.range) then
					self:CastR(hero, "KillSteal")
				end
				
				if UseW and self:Ready(_W) and ValidTarget(hero, self.W.range) then
					self:CastW(hero, "KillSteal")
				end
				
				if UseE and self:Ready(_E) and self:IsPoisoned(hero) and ValidTarget(hero, self.E.range) then
					self:CastE(hero)
				end
				
				if UseQ and self:Ready(_Q) and ValidTarget(hero, self.Q.range) then
					self:CastQ(hero, "KillSteal")
				end
				
				break
			end
			
		end
		
	end
	
---------------------------------------------------------------------------------
	--Ignite
	if UseIgnite and self:Ready(self.Ignite) then
	
		for i, hero in ipairs(self.EnemyHeroes) do
		
			if self.Menu.Prediction.Choice == 1 and self.HPred then
				QPos, QHitChance = self.HPred:GetPredict(self.HPred.Presets["Cassiopeia"]["Q"], hero, myHero)
				WPos, WHitChance = self.HPred:GetPredict(self.HPred.Presets["Cassiopeia"]["W"], hero, myHero)
				RPos, RHitChance = self.HPred:GetPredict(self.HPred.Presets["Cassiopeia"]["R"], hero, myHero)
			elseif self.Menu.Prediction.Choice == 2 and self.KPred then
				QPos, QHitChance = self.KPred:GetPrediction(self.KPred.Presets["Cassiopeia"]["Q"], hero, myHero)
				WPos, WHitChance = self.KPred:GetPrediction(self.KPred.Presets["Cassiopeia"]["W"], hero, myHero)
				RPos, RHitChance = self.KPred:GetPrediction(self.KPred.Presets["Cassiopeia"]["R"], hero, myHero)
			end
			
			local Q_HeroDmg = UseQ and self:Ready(_Q) and ValidTarget(hero, self.Q.range) and self:GetDmg("Q", hero) or 0
			local Q_HeroDmg_2 = UseQ and self:Ready(_Q) and (QHitChance >= 2) and ValidTarget(hero, self.Q.range) and self:GetDmg("Q", hero) or 0
			local W_HeroDmg = UseW and self:Ready(_W) and ValidTarget(hero, self.W.range) and self:GetDmg("W", hero) or 0
			local W_HeroDmg_2 = UseW and self:Ready(_W) and (WHitChance >= 2) and ValidTarget(hero, self.W.range) and self:GetDmg("W", hero) or 0
			local E_HeroDmg = UseE and (GetSpellData(_E).currentCd <= 0.5) and self:IsPoisoned(hero) and ValidTarget(hero, self.E.range) and self:GetDmg("E", hero) or 0
			local R_HeroDmg = UseR and self:Ready(_R) and (not RSave or (Q_HeroDmg+W_HeroDmg+SmartNoE*E_HeroDmg < hero.health)) and ValidTarget(hero, self.R.range) and self:GetDmg("R", hero) or 0
			local R_HeroDmg_2 = UseR and self:Ready(_R) and (not RSave or (Q_HeroDmg+W_HeroDmg+SmartNoE*E_HeroDmg < hero.health)) and (RHitChance >= 2) and ValidTarget(hero, self.R.range) and self:GetDmg("R", hero) or 0
			local Ignite_HeroDmg = IgniteEarly and self:GetDmg("Ignite", hero)+Q_HeroDmg_2+W_HeroDmg_2+SmartNoE*E_HeroDmg+R_HeroDmg_2 or self:GetDmg("Ignite", hero)
			
			local Mana = (Q_TargetDmg_2 ~= 0 and self:Mana(_Q) or 0)+(W_TargetDmg_2 ~= 0 and self:Mana(_W) or 0)+(E_TargetDmg ~= 0 and SmartNoE*self:Mana(_E) or 0)+(R_HeroDmg_2 ~= 0 and self:Mana(_R) or 0)
			
			if (myHero.mana >= Mana) and (Ignite_HeroDmg >= hero.health) and (not IgniteSave or (Q_HeroDmg+W_HeroDmg+SmartNoE*E_HeroDmg+R_HeroDmg < hero.health)) and ValidTarget(hero, self.I.range) then
				self:CastIgnite(hero)
				break
			end
			
		end
		
	end
	
---------------------------------------------------------------------------------
	--R
	if UseR and self:Ready(_R) then
	
		local QPos, QHitChance
		local WPos, WHitChance
		local RPos, RHitChance

		for i, hero in ipairs(self.EnemyHeroes) do
		
			local Q_HeroDmg = UseQ and self:Ready(_Q) and ValidTarget(hero, self.Q.range) and self:GetDmg("Q", hero) or 0
			local W_HeroDmg = UseW and self:Ready(_W) and ValidTarget(hero, self.W.range) and self:GetDmg("W", hero) or 0
			local E_HeroDmg = UseE and (GetSpellData(_E).currentCd <= 0.5) and self:IsPoisoned(hero) and ValidTarget(hero, self.E.range) and self:GetDmg("E", hero) or 0
			local R_HeroDmg = self:GetDmg("R", hero)
			
			local Mana = (Q_TargetDmg ~= 0 and self:Mana(_Q) or 0)+(W_TargetDmg ~= 0 and self:Mana(_W) or 0)+(E_TargetDmg ~= 0 and SmartNoE*self:Mana(_E) or 0)+self:Mana(_R)
			
			if (myHero.mana >= Mana) and (R_HeroDmg >= hero.health) and (not RSave or (Q_HeroDmg+W_HeroDmg+SmartNoE*E_HeroDmg < hero.health)) and not (self:IsInvulnerable(hero, self.R.delay) or self:IsShielding(hero, self.R.delay)) and ValidTarget(hero, self.R.range) then
				self:CastR(hero, "KillSteal")
				break
			end
			
		end
		
	end
	
---------------------------------------------------------------------------------
	--E
	if UseE and self:Ready(_E) then
	
		for i, hero in ipairs(self.EnemyHeroes) do
		
			local PH_H = self:PredictHealth(hero, self.E.delay+GetDistance(hero)/(self.E.speed+hero.ms))
			
			local E_HeroDmg = self:GetDmg("E", hero)
			
			if (E_HeroDmg >= PH_H) and (EKS or self:IsPoisoned(hero)) and ValidTarget(hero, self.E.range) then
				self:CastE(hero)
			end
			
		end
		
	end
	
---------------------------------------------------------------------------------
	--Q
	if UseQ and self:Ready(_Q) then
	
		for i, hero in ipairs(self.EnemyHeroes) do
		
			local PH = self:PredictHealth(hero, self.Q.delay)
			
			local Q_HeroDmg = self:GetDmg("Q", hero)
			
			if (Q_HeroDmg >= PH) and ValidTarget(hero, self.Q.range) then
				self:CastQ(hero, "KillSteal")
			end
			
		end
		
	end
	
---------------------------------------------------------------------------------
	--W
	if UseW and self:Ready(_W) then
	
		for i, hero in ipairs(self.EnemyHeroes) do
		
			local PH_H = self:PredictHealth(hero, self.W.delay+GetDistance(hero)/(self.W.speed+hero.ms))
			
			local W_HeroDmg = self:GetDmg("W", hero)
			
			if (W_HeroDmg >= PH_H) and ValidTarget(hero, self.W.range) then
				self:CastW(hero, "KillSteal")
			end
			
		end
		
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:Farm()

	local UseQ = self.Menu.Clear.Farm.UseQ
	local QMP = self.Menu.Clear.Farm.QMP
	
	local UseW = self.Menu.Clear.Farm.UseW
	local WMP = self.Menu.Clear.Farm.WMP
	
	local UseE = self.Menu.Clear.Farm.UseE
	
	--local UseItem = self.Menu.Clear.UseItem
	
	if UseItem then
		--self:FarmItem()
	end
	
	if UseE and self:Ready(_E) then
		self:FarmE()
	end
	
	if UseQ and self:Ready(_Q) and (self:ManaPercent() >= QMP) then
		self:FarmQ()
	end
	
	if UseW and self:Ready(_W) and (self:ManaPercent() >= WMP) then
		self:FarmW()
	end
	
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:FarmE()

	local EMP = self.Menu.Clear.Farm.EMP
	local ENP = self.Menu.Clear.Farm.ENP
	
	for i, minion in ipairs(self.EnemyMinions.objects) do
	
		local PH_L = self:PredictHealth(minion, self.E.delay+GetDistance(minion)/self.E.speed)
		local PH_H = self:PredictHealth(minion, self.E.delay+GetDistance(minion)/(self.E.speed+minion.ms))
		
		local EMinionDmg = self:GetDmg("E", minion)
		
		if (PH_L > 0) and (EMinionDmg >= PH_H) and ((self:ManaPercent() < ENP) or self:IsPoisoned(minion)) and ValidTarget(minion, self.E.range) then
			self:CastE(minion)
			return
		end
		
	end
	
	for i, minion in ipairs(self.EnemyMinions.objects) do
	
		local PH_L = self:PredictHealth(minion, self.E.delay+GetDistance(minion)/self.E.speed)
		
		local EMinionDmg = self:GetDmg("E", minion)
		
		if (PH_L > 0) and (minion.charName == "SRU_OrderMinionSuper" or minion.charName == "SRU_ChaosMinionSuper") and self:IsPoisoned(minion) and ValidTarget(minion, self.E.range) then
			self:CastE(minion)
			return
		end
		
	end
	
	for i, minion in ipairs(self.EnemyMinions.objects) do
	
		local PH_L = self:PredictHealth(minion, self.E.delay+GetDistance(minion)/self.E.speed)
		
		local EMinionDmg = self:GetDmg("E", minion)
		
		if (PH_L > 0) and (self:ManaPercent() >= EMP) and self:IsPoisoned(minion) and ValidTarget(minion, self.E.range) then
			self:CastE(minion)
			return
		end
		
	end
	
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:FarmQ()

	for i, minion in ipairs(self.EnemyMinions.objects) do
	
		local PH = self:PredictHealth(minion, self.Q.delay)
		
		local QMinionDmg = self:GetDmg("Q", minion)/3
		
		if (PH > 0) and (QMinionDmg >= PH) and ValidTarget(minion, self.Q.range) then
			self:CastQ(minion)
			return
		end
		
	end
	
	for i, minion in ipairs(self.EnemyMinions.objects) do
	
		local PH = self:PredictHealth(minion, self.Q.delay)
		
		if (PH > 0) and (minion.charName == "SRU_OrderMinionSuper" or minion.charName == "SRU_ChaosMinionSuper") and ValidTarget(minion, self.Q.range) then
			self:CastQ(minion)
			return
		end
		
	end
	
	if UseE and GetSpellData(_E).currentCd <= 0.5 then
	
		for i, minion in ipairs(self.EnemyMinions.objects) do
		
			local PH_L = self:PredictHealth(minion, self.Q.delay+self.E.delay+GetDistance(minion)/self.E.speed)
			local PH_H = self:PredictHealth(minion, self.Q.delay+self.E.delay+GetDistance(minion)/(self.E.speed+minion.ms))
			
			local QMinionDmg = self:GetDmg("Q", minion)
			local EMinionDmg = self:GetDmg("E", minion)
			
			if (PH_L > QMinionDmg/3+EMinionDmg) and (QMinionDmg+EMinionDmg >= PH_H) and ValidTarget(minion, self.Q.range) then
				self:CastQ(minion)
				return
			end
			
		end
		
	end
	
	local QMin = self.Menu.Clear.Farm.QMin
	local QNP = self.Menu.Clear.Farm.QNP
	
	for i, minion in ipairs(self.EnemyMinions.objects) do
	
		local PH = self:PredictHealth(minion, self.Q.delay)
		
		if (PH > 0) and ValidTarget(minion, self.Q.range+self.Q.delay*minion.ms) then
		
			local N = 0

			local QPos

			if self.Menu.Prediction.Choice == 1 and self.HPred then
				QPos = self.HPred:PredictPos(minion, self.Q.delay)
			elseif self.Menu.Prediction.Choice == 2 and self.KPred then
				QPos = self.KPred:GetPos(minion, self.Q.delay)
			end

			for j, minion_2 in ipairs(self.EnemyMinions.objects) do
			
				local QPos_2

				if self.Menu.Prediction.Choice == 1 and self.HPred then
					QPos_2 = self.HPred:PredictPos(minion_2, self.Q.delay)
				elseif self.Menu.Prediction.Choice == 2 and self.KPred then
					QPos_2 = self.KPred:GetPos(minion_2, self.Q.delay)
				end

				if QPos and QPos_2 and (GetDistance(QPos_2, QPos) <= self.Q.radius) and (not QNP or not self:IsPoisoned(minion_2, self.Q.delay)) then
					N = N+1
				end
				
				if (N >= QMin) then
					CastSpell(_Q, QPos.x, QPos.z)
					break
					break
				end
				
			end
			
		end
		
	end
	
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:FarmW()

	local WMin = self.Menu.Clear.Farm.WMin
	local WNP = self.Menu.Clear.Farm.WNP
	
	for i, minion in ipairs(self.EnemyMinions.objects) do
	
		if ValidTarget(minion, self.W.range+self.W.delay*minion.ms) then
		
			local N = 0

			local WPos

			if self.Menu.Prediction.Choice == 1 and self.HPred then
				WPos = self.HPred:PredictPos(minion, self.W.delay+GetDistance(minion)/(self.W.speed+minion.ms))
			elseif self.Menu.Prediction.Choice == 2 and self.KPred then
				WPos = self.KPred:GetPos(minion, self.W.delay+GetDistance(minion)/(self.W.speed+minion.ms))
			end
			
			for j, minion_2 in ipairs(self.EnemyMinions.objects) do
			
				local WPos_2

				if self.Menu.Prediction.Choice == 1 and self.HPred then
					WPos_2 = WPos and self.HPred:PredictPos(minion_2, self.W.delay+GetDistance(WPos)/self.W.speed) or nil
				elseif self.Menu.Prediction.Choice == 2 and self.KPred then
					WPos_2 = WPos and self.KPred:GetPos(minion_2, self.W.delay+GetDistance(WPos)/self.W.speed) or nil
				end
				
				if WPos_2 and (GetDistance(WPos_2, WPos) <= 2*self.W.radius) and (not WNP or not self:IsPoisoned(minion_2, self.W.delay+GetDistance(WPos)/self.W.speed)) then
					N = N+1
				end
				
				if (N >= WMin) then
					CastSpell(_W, WPos.x, WPos.z)
					break
					break
				end
				
			end
			
		end
		
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:JFarm()

	local UseQ = self.Menu.Clear.JFarm.UseQ
	local QMP = self.Menu.Clear.JFarm.QMP
	local QNP = self.Menu.Clear.JFarm.QNP
	
	local UseW = self.Menu.Clear.JFarm.UseW
	local WMP = self.Menu.Clear.JFarm.WMP
	local WMin = self.Menu.Clear.JFarm.WMin
	local WNP = self.Menu.Clear.JFarm.WNP
	
	local UseE = self.Menu.Clear.JFarm.UseE
	local EMP = self.Menu.Clear.JFarm.EMP
	
	--local UseItem = self.Menu.Clear.UseItem
	
	local LargeJunglemob
	
	for i, junglemob in ipairs(self.JungleMobs.objects) do
	
		for j = 1, #self.FocusJungleNames do
		
			if junglemob.name == self.FocusJungleNames[j] then
				LargeJunglemob = junglemob
				break
				break
			end
			
		end
		
	end
	
---------------------------------------------------------------------------------
	--Item
	--[[if UseItem then
	
		if LargeJunglemob then
			
		else
		
			for i, junglemob in ipairs(self.JungleMobs.objects) do
				
			end
			
		end
		
	end]]
	
---------------------------------------------------------------------------------
	--W
	if UseW and self:Ready(_W) and (self:ManaPercent() >= WMP) then
	
		if LargeJunglemob then
		
			if (not WNP or not self:IsPoisoned(LargeJunglemob, self.W.delay+GetDistance(LargeJunglemob)/(self.W.speed+LargeJunglemob.ms))) and ValidTarget(LargeJunglemob, self.W.range) then
				self:CastW(LargeJunglemob)
			end
			
		else
		
			for i, junglemob in ipairs(self.JungleMobs.objects) do
			
				if (not WNP or not self:IsPoisoned(junglemob, self.W.delay+GetDistance(junglemob)/(self.W.speed+junglemob.ms))) and ValidTarget(junglemob, self.W.range) then
					self:CastW(junglemob)
					break
				end
				
			end
			
			--[[for i, junglemob in ipairs(self.JungleMobs.objects) do
			
				if ValidTarget(junglemob, self.W.range+self.W.delay*junglemob.ms) then
				
					local N = 0
					local WPos = self.HPred:PredictPos(junglemob, self.W.delay+GetDistance(minion)/(self.W.speed+minion.ms))
					
					for j, junglemob_2 in ipairs(self.JungleMobs.objects) do
					
						local WPos_2 = WPos and self.HPred:PredictPos(junglemob_2, self.W.delay+GetDistance(WPos)/self.W.speed) or nil
						
						if WPos_2 and (GetDistance(WPos_2, WPos) <= 2*self.W.radius) and (not WNP or not self:IsPoisoned(junglemob_2, self.W.delay+GetDistance(WPos)/self.W.speed)) then
							N = N+1
						end
						
						if (N >= WMin) then
							CastSpell(_W, WPos.x, WPos.z)
							break
							break
						end
						
					end
					
				end
				
			end]]
			
		end
		
	end
	
---------------------------------------------------------------------------------
	--E
	if UseE and self:Ready(_E) and (self:ManaPercent() >= EMP) then
	
		if LargeJunglemob then
		
			if self:IsPoisoned(LargeJunglemob) and ValidTarget(LargeJunglemob, self.E.range) then
				self:CastE(LargeJunglemob)
			end
			
		else
		
			for i, junglemob in ipairs(self.JungleMobs.objects) do
			
				if self:IsPoisoned(junglemob) and ValidTarget(junglemob, self.E.range) then
					self:CastE(junglemob)
					break
				end
				
			end
			
		end
		
	end
	
---------------------------------------------------------------------------------
	--Q
	if UseQ and self:Ready(_Q) and (self:ManaPercent() >= QMP) then
	
		if LargeJunglemob then
		
			if (not QNP or not self:IsPoisoned(LargeJunglemob, self.Q.delay)) and ValidTarget(LargeJunglemob, self.Q.range) then
				self:CastQ(LargeJunglemob)
			end
			
		else
		
			for i, junglemob in ipairs(self.JungleMobs.objects) do
			
				if (not QNP or not self:IsPoisoned(junglemob, self.Q.delay)) and ValidTarget(junglemob, self.Q.range) then
					self:CastQ(junglemob)
					break
				end
				
			end
			
		end
		
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:LastHit()

	local UseQ = self.Menu.LastHit.UseQ
	local QMP = self.Menu.LastHit.QMP
	
	local UseE = self.Menu.LastHit.UseE
	
	if UseQ and self:Ready(_Q) and (self:ManaPercent() >= QMP) then
		self:LastHitQ()
	end
	
	if UseE and self:Ready(_E) then
		self:LastHitE()
	end
	
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:LastHitQ()

	for i, minion in ipairs(self.EnemyMinions.objects) do
	
		local PH = self:PredictHealth(minion, self.Q.delay)
		
		local Q_MinionDmg = self:GetDmg("Q", minion)/3
		
		if (PH > 0) and (Q_MinionDmg >= PH) and ValidTarget(minion, self.Q.range) then
			self:CastQ(minion)
			return
		end
		
	end
	
	if UseE and GetSpellData(_E).currentCd <= 0.5 then
	
		for i, minion in ipairs(self.EnemyMinions.objects) do
		
			local PH_L = self:PredictHealth(minion, self.Q.delay+self.E.delay+GetDistance(minion)/self.E.speed)
			local PH_H = self:PredictHealth(minion, self.Q.delay+self.E.delay+GetDistance(minion)/(self.E.speed+minion.ms))
			
			local QMinionDmg = self:GetDmg("Q", minion)
			local EMinionDmg = self:GetDmg("E", minion)
			
			if (PH_L > QMinionDmg/3+EMinionDmg) and (QMinionDmg+EMinionDmg >= PH_H) and ValidTarget(minion, self.Q.range) then
				self:CastQ(minion)
				return
			end
			
		end
		
	end
	
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:LastHitE()

	local ENP = self.Menu.LastHit.ENP
	
	for i, minion in ipairs(self.EnemyMinions.objects) do
	
		local PH_L = self:PredictHealth(minion, self.E.delay+GetDistance(minion)/self.E.speed)
		local PH_H = self:PredictHealth(minion, self.E.delay+GetDistance(minion)/(self.E.speed+minion.ms))
		
		local E_MinionDmg = self:GetDmg("E", minion)
		
		if (PH_L > 0) and (E_MinionDmg >= PH_H) and ((self:ManaPercent() < ENP) or self:IsPoisoned(minion)) and ValidTarget(minion, self.E.range) then
			self:CastE(minion)
			return
		end
		
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:Flee()
	self:MoveToMouse()
	
	local UseE = self.Menu.Flee.UseE
	
	if UseE and self:Ready(_E) then
	
		for i, hero in ipairs(self.EnemyHeroes) do
		
			if self:IsPoisoned(hero) and ValidTarget(hero, self.E.range) then
				self:CastE(hero)
			end
			
		end
		
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:JSteal()

	for i, junglemob in pairs(self.JungleMobs.objects) do
	
		local S_JunglemobDmg = self:GetDmg("Smite", junglemob)
		
		for j = 1, #self.FocusJungleNames do
		
			if junglemob.name == self.FocusJungleNames[j] and (S_JunglemobDmg >= junglemob.health) and ValidTarget(junglemob, self.S.range) then
				self:CastSmite(junglemob)
				return
			end
			
		end
		
	end
	
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:SKillSteal()

	if myHero:GetSpellData(SUMMONER_1).name:lower() == "s5_summonersmiteplayerganker" then
		self.SB = SUMMONER_1
	elseif myHero:GetSpellData(SUMMONER_2).name:lower() == "s5_summonersmiteplayerganker" then
		self.SB = SUMMONER_2
	end
	
	if self.SB then
	
		for i, hero in ipairs(self.EnemyHeroes) do
		
			local SB_TargetDmg = self:GetDmg("SB", hero)
			
			if (SB_TargetDmg >= hero.health) and ValidTarget(hero, self.S.range) then
				self:CastSmite(hero)
			end
			
		end
		
	end
	
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:JStealAlways()

	for i, junglemob in pairs(self.JungleMobs.objects) do
	
		local S_JunglemobDmg = self:GetDmg("Smite", junglemob)
		
		for j = 1, #self.FocusJungleNames do
		
			if (junglemob.name == "SRU_Baron12.1.1" or self.SMenu.JSteal.Dragon and junglemob.name == "SRU_Dragon6.1.1") and (S_JunglemobDmg >= junglemob.health) and ValidTarget(junglemob, self.S.range) then
				self:CastSmite(junglemob)
				return
			end
			
		end
		
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:MoveToPos(movePos)
	myHero:MoveTo(movePos.x, movePos.z)
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:MoveToMouse()

	local MovePos
	
	if (GetDistance(mousePos) < 100) then
		MovePos = myHero+(Vector(movePos)-myHero):normalized()*100
	else
		MovePos = mousePos
	end
	
	self:MoveToPos(MovePos)
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:CastQ(enemy, mode)

	if not self:IsValid(enemy) or mode and self:IsInvulnerable(enemy, self.Q.WindUpTime) then
		return
	end
	
	local QPos, QHitChance = nil, 0

	if self.Menu.Prediction.Choice == 1 and self.HPred then
		QPos, QHitChance = self.HPred:GetPredict(self.HPred.Presets["Cassiopeia"]["Q"], enemy, myHero)

		if mode == "Combo" and QHitChance >= self.Menu.Prediction.HPrediction.ComboQ or mode == "Harass" and QHitChance >= self.Menu.Prediction.HPrediction.HarassQ then
			CastSpell(_Q, QPos.x, QPos.z)
		end

	elseif self.Menu.Prediction.Choice == 2 and self.KPred then
		QPos, QHitChance = self.KPred:GetPrediction(self.KPred.Presets["Cassiopeia"]["Q"], enemy, myHero)

		if mode == "Combo" and QHitChance >= self.Menu.Prediction.KPrediction.ComboQ or mode == "Harass" and QHitChance >= self.Menu.Prediction.KPrediction.HarassQ then
			CastSpell(_Q, QPos.x, QPos.z)
		end

	end

	if (mode == "KillSteal" or mode == nil) and QHitChance >= 1 then
		CastSpell(_Q, QPos.x, QPos.z)
	end

end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:CastW(enemy, mode)

	if not self:IsValid(enemy) then
		return
	end
	
	local WPos, WHitChance = nil, 0

	if self.Menu.Prediction.Choice == 1 and self.HPred then
		WPos, WHitChance = self.HPred:GetPredict(self.HPred.Presets["Cassiopeia"]["W"], enemy, myHero)

		if mode and self.WPos and self:IsInvulnerable(enemy, self.W.delay+GetDistance(self.WPos)/self.W.speed) then
			return
		end

		if mode == "Combo" and WHitChance >= self.Menu.Prediction.HPrediction.ComboW or mode == "Harass" and WHitChance >= self.Menu.Prediction.HPrediction.HarassW then
			CastSpell(_W, WPos.x, WPos.z)
		end

	elseif self.Menu.Prediction.Choice == 2 and self.KPred then
		WPos, WHitChance = self.KPred:GetPrediction(self.KPred.Presets["Cassiopeia"]["W"], enemy, myHero)

		if mode and self.WPos and self:IsInvulnerable(enemy, self.W.delay+GetDistance(self.WPos)/self.W.speed) then
			return
		end

		if mode == "Combo" and WHitChance >= self.Menu.Prediction.KPrediction.ComboW or mode == "Harass" and WHitChance >= self.Menu.Prediction.KPrediction.HarassW then
			CastSpell(_W, WPos.x, WPos.z)
		end

	end

	if (mode == "KillSteal" or mode == nil) and (WHitChance >= 1) then
		CastSpell(_W, WPos.x, WPos.z)
	end

end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:CastE(enemy)

	if not self:IsValid(enemy) or self:IsInvulnerable(enemy) then
		return
	end
	
	if (os.clock() >= self.LastE+self.Menu.Misc.EDelay) then
		CastSpell(_E, enemy)
	end
	
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:CastR(enemy, mode)

	if not self:IsValid(enemy) then
		return
	end
	
	if self.Menu.Prediction.Choice == 1 and self.HPred then

		if mode == "Combo_M" then

			local RPos, RHitChance, RNoH = self.HPred:GetPredict(self.HPred.Presets["Cassiopeia"]["R"], enemy, myHero, true)

			if (self:IsInvulnerable(enemy, self.R.WindUpTime) or self:IsShielding(enemy, self.R.WindUpTime)) then
				RNoH = RNoH-1
			end

			if RPos and RNoH >= self.Menu.Combo.Ulti.RMin then
				CastSpell(_R, RPos.x, RPos.z)
			end

		else

			if mode and (self:IsInvulnerable(enemy, self.R.WindUpTime) or self:IsShielding(enemy, self.R.WindUpTime)) then
				return
			end

			local RPos, RHitChance = self.HPred:GetPredict(self.HPred.Presets["Cassiopeia"]["R"], enemy, myHero)

			if mode == "Combo_S" and RHitChance >= self.Menu.Prediction.HPrediction.ComboR or mode == "KillSteal" and RHitChance >= 2 or mode == nil and RHitChance >= 1 then
				CastSpell(_R, RPos.x, RPos.z)
			end

		end

	elseif self.Menu.Prediction.Choice == 2 and self.KPred then

		if mode == "Combo_M" then

			local RNoH = #self.KPred:GetHeroes(self.KPred.Presets["Cassiopeia"]["R"], myHero, myHero)

			if RNoH >= self.Menu.Combo.Ulti.RMin then
				CastSpell(_R, RPos.x, RPos.z)
			end

		else

			if mode and (self:IsInvulnerable(enemy, self.R.WindUpTime) or self:IsShielding(enemy, self.R.WindUpTime)) then
				return
			end

			local RPos, RHitChance = self.KPred:GetPrediction(self.KPred.Presets["Cassiopeia"]["R"], enemy, myHero)

			if mode == "Combo_S" and RHitChance >= self.Menu.Prediction.KPrediction.ComboR or mode == "KillSteal" and RHitChance >= 2 or mode == nil and RHitChance >= 1 then
				CastSpell(_R, RPos.x, RPos.z)
			end

		end

	end

end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:CastIgnite(enemy)

	if enemy.dead or self:IsInvulnerable(enemy) or self:IsShielding(enemy) then
		return
	end
	
	CastSpell(self.Ignite, enemy) 
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:CastSmite(enemy)

	if enemy.dead or self:IsInvulnerable(enemy) or self:IsShielding(enemy) then
		return
	end
	
	CastSpell(self.Smite, enemy)
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:CastItem(enemy, item)

	if enemy.dead or self:IsInvulnerable(enemy) then
		return
	end
	
	for i=ITEM_1, ITEM_6 do
		--if item == "BRK" and self:IsShielding(enemy) then return end
		if (item == "Tiamat" or item == "Hydra") and myHero:GetSpellData(i).name == "ItemTiamatCleave" or item == "Titanic" and myHero:GetSpellData(i).name == "ItemTitanicHydraCleave" or item == "Youmu" and myHero:GetSpellData(i).name == "YoumusBlade" then
			CastSpell(i, enemy)
			return
		end
		
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:GetDmg(spell, enemy)

	if enemy.dead then
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
	local MagicPen = myHero.magicPen
	local MagicPenPercent = myHero.magicPenPercent
	
	local Armor = math.max(0, enemy.armor*ArmorPenPercent-ArmorPen)
	local ArmorPercent = Armor/(100+Armor)
	local MagicArmor = math.max(0, enemy.magicArmor*MagicPenPercent-MagicPen)
	local MagicArmorPercent = MagicArmor/(100+MagicArmor)
	
	if spell == "Ignite" then
	
		local TrueDmg = 50+20*Level
		
		return TrueDmg
	elseif spell == "Smite" then
	
		if (Level <= 4) then
		
			local TrueDmg = 370+20*Level
			
			return TrueDmg
		elseif (Level <= 9) then
		
			local TrueDmg = 330+30*Level
			
			return TrueDmg
		elseif (Level <= 14) then
		
			local TrueDmg = 240+40*Level
			
			return TrueDmg
		else
		
			local TrueDmg = 100+50*Level
			
			return TrueDmg
		end
		
	elseif spell == "SB" then
	
		local TrueDmg = 20+8*Level
		
		return TrueDmg
	elseif spell == "BC" then
		APDmg = 100
	elseif spell == "BRK" then
		ADDmg = math.max(100, .1*enemy.maxHealth)
	elseif spell == "AA" then
		ADDmg = TotalDmg
	elseif spell == "Q" then
		APDmg = 40*self:Level(_Q)+35+.4*AP
	elseif spell == "W" then
		APDmg = 2*(5*self:Level(_W)+5+.1*AP)
	elseif spell == "E" then
		APDmg = 25*self:Level(_E)+30+.55*AP
	elseif spell == "R" then
		APDmg = 100*self:Level(_R)+50+.5*AP
	end
	
	local TrueDmg = ADDmg*(1-ArmorPercent)+APDmg*(1-MagicArmorPercent)
	
	return TrueDmg
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:OnDraw()

	if not self.Menu.Draw.On or myHero.dead then
		return
	end
	
	if self.Menu.Draw.Target then
	
		if self.STarget and self.Menu.Misc.STarget and ValidTarget(self.STarget, self.Menu.Misc.SRange) then
			self:DrawCircle(self.STarget.x, self.STarget.y, self.STarget.z, 2*self.STarget.boundingRadius, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
		else
		
			if self.STarget and self.Menu.Misc.STarget then
				self:DrawCircle(self.STarget.x, self.STarget.y, self.STarget.z, 2*self.STarget.boundingRadius, ARGB(0xFF, 0xFF, 0x00, 0x00))
			end
			
			if self.Target then
				self:DrawCircle(self.Target.x, self.Target.y, self.Target.z, 2*self.Target.boundingRadius, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
			end
			
		end
		
	end
	
	if self.Menu.Draw.AA then
		self:DrawCircle(myHero.x, myHero.y, myHero.z, myHero.range+self:AddRange(myHero), ARGB(0xFF, 0, 0xFF, 0))
	end
	
	if self.Menu.Draw.Q then
		self:DrawCircle(myHero.x, myHero.y, myHero.z, self.Q.range, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
	end
	
	if self.Menu.Draw.W and self:Ready(_W) then
		self:DrawCircle(myHero.x, myHero.y, myHero.z, self.W.range, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
	end
	
	if self.Menu.Draw.E then
		self:DrawCircle(myHero.x, myHero.y, myHero.z, self.E.range, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
	end
	
	if self.Menu.Draw.R and self:Ready(_R) then
		self:DrawCircle(myHero.x, myHero.y, myHero.z, self.R.range, ARGB(0xFF, 0xFF, 0x00, 0x00))
	end
	
	if self.Menu.Draw.ComboDamage then
	
		for i, hero in ipairs(self.EnemyHeroes) do
		
			if ValidTarget(hero, 2000) then
				self:DrawDamage(hero)
			end
			
		end
		
	end
	
	if self.Smite and self.SMenu.Draw.On and self.SMenu.Draw.S then
		self:DrawSmite()
	end
	
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:DrawDamage(unit)

	local SPos, EPos = self:GetHealthPos(unit)
	local PercentDamage = math.min(unit.health/unit.maxHealth, self:ComboDamage(unit)/unit.maxHealth)
	local DPos = Point(EPos.x-104*PercentDamage, SPos.y)
	
	if (self:ComboDamage(unit) > unit.health) then
		DrawText("OverDamage: " .. math.floor(self:ComboDamage(unit)-unit.health), 20, SPos.x, SPos.y-55, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
	end
	
	if self:Ready(_R) then
	 
		local RUnitDmg = self:GetDmg("R", unit) or 0
		local RPercentDamage = math.min(unit.health/unit.maxHealth, RUnitDmg/unit.maxHealth)
		local RPos = Point(DPos.x+104*RPercentDamage, EPos.y)
		
		DrawLine(RPos.x, RPos.y, EPos.x, EPos.y, 3, ARGB(0xFF, 0xEE, 0xEE, 0xEE))
		DrawLine(DPos.x, DPos.y, RPos.x, RPos.y, 3, ARGB(0xFF, 0x22, 0xDD, 0x22))
	else
		DrawLine(DPos.x, DPos.y, EPos.x, EPos.y, 3, ARGB(0xFF, 0xEE, 0xEE, 0xEE))
	end
	
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:GetHealthPos(unit)

	local Pos = GetUnitHPBarPos(unit)
	local PosOffset = GetUnitHPBarOffset(unit)
	
	Pos.x = Pos.x-66
	
	if unit.charName == "Darius" then
		Pos.x = Pos.x-7
	end
	
	Pos.y = Pos.y+52*PosOffset.y+6
	
	return Point(Pos.x, Pos.y), Point(Pos.x+104*(unit.health/unit.maxHealth), Pos.y)
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:ComboDamage(unit)

	local Q_UnitDmg = self:Ready(_Q) and self:GetDmg("Q", unit) or 0
	local W_UnitDmg = self:Ready(_W) and self:GetDmg("W", unit) or 0
	local E_UnitDmg = (GetSpellData(_E).currentCd <= 0.5) and self:GetNoE(unit)*self:GetDmg("E", unit) or 0
	local R_UnitDmg = self:Ready(_R) and self:GetDmg("R", unit) or 0
	
	return Q_UnitDmg+W_UnitDmg+E_UnitDmg+R_UnitDmg
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:DrawSmite()

	if self.SMenu.JSteal.On or self.SMenu.JSteal.On2 then
	
		if self:Ready(self.Smite) then
			DrawCircle(myHero.x, myHero.y, myHero.z, self.S.range, ARGB(0xFF, 0x99, 0x14, 0x66))
		else
			DrawCircle(myHero.x, myHero.y, myHero.z, self.S.range, ARGB(0xFF, 0x14, 0x14, 0x14))
		end
		
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:DrawCircle(x, y, z, radius, color)

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

function HTTF_Cassiopeia:DrawCircles2(x, y, z, radius, color)

	local length = 75
	local radius = radius*.92
	local quality = math.max(8, self:round(180/math.deg((math.asin((length/(2*radius)))))))
	local quality = 2*math.pi/quality
	local points = {}
	
	for theta = 0, 2*math.pi+quality, quality do
	
		local c = WorldToScreen(D3DXVECTOR3(x+radius*math.cos(theta), y, z-radius*math.sin(theta)))
		points[#points+1] = D3DXVECTOR2(c.x, c.y)
	end
	
	DrawLines2(points, 2, color or 4294967295)
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:round(num)

	if (num >= 0) then
		return math.floor(num+1/2)
	else
		return math.ceil(num-1/2)
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:OnAnimation(unit, animation)

	if unit ~= myHero then
		return
	end
	
	if animation == "" then
	else
		--print("Ani: " .. animation)
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:OnProcessAttack(unit, spell)

	if (unit.team == myHero.team and unit.type ~= myHero.type or unit.team == 300) and spell.target and spell.name:find("BasicAttack") then
	
		if (spell.target.networkID < 100) and self.PredictionDamage[spell.target.networkID] == nil then
			self.PredictionDamage[spell.target.networkID] = {}
		end
		
		if self.PredictionDamage[spell.target.networkID] then
		
			if self.ProjectileSpeed[unit.charName] then
			
				local ctime = os.clock()+GetDistance(spell.target, unit)/self.ProjectileSpeed[unit.charName]-GetLatency()/1000
				
				self.PredictionDamage[spell.target.networkID][ctime] = self:GetAADmg(spell.target, unit)
			end
			
		end
		
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:OnProcessSpell(unit, spell)

	if unit == myHero then
	
		if spell.name == "CassiopeiaTwinFang" then
			self.LastE = os.clock()-GetLatency()/1000
		else
			--print("Proc: " .. spell.name)
		end
		
	end
	
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:PredictHealth(unit, time)

	local health = unit.health
	
	if self.PredictionDamage[unit.networkID] then
	
		local Delete = true
		
		for ctime, damage in pairs(self.PredictionDamage[unit.networkID]) do
		
			if (os.clock() < ctime) then
				Delete = false
				break
			end
			
		end
		
		if Delete then
			self.PredictionDamage[unit.networkID] = nil
		else
		
			for ctime, damage in pairs(self.PredictionDamage[unit.networkID]) do
			
				if (os.clock() >= ctime) then
					self.PredictionDamage[unit.networkID][ctime] = nil
				elseif (os.clock()+time > ctime+0.07) then
					health = health-damage
				end
				
			end
			
		end
		
	end
	
	return health
end

---------------------------------------------------------------------------------

function HTTF_Cassiopeia:GetAADmg(enemy, attacker)

	local Armor = math.max(0, enemy.armor*attacker.armorPenPercent-attacker.armorPen)
	local ArmorPercent = Armor/(100+Armor)
	local TrueDmg = attacker.totalDamage*(1-ArmorPercent)
	
	return TrueDmg
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:OnUpdateBuff(unit, buff, stacks)

	if unit == myHero then
	
		if buff.name == "" then
		else
			--print("Update: " .. unit.charName .. " " .. buff.name)
		end
		
	elseif unit and unit.team ~= myHero.team and (GetDistance(unit) < 2000) then
	
		if buff.name == "bantamtraptarget" then
		elseif buff.name == "cassiopeianoxiousblastpoison" then
		elseif buff.name == "cassiopeiamiasmapoison" then
		elseif buff.name == "poisontrailtarget" then
		elseif buff.name == "s5junglemushroompoison" then
		elseif buff.name == "toxicshotparticle" then
		elseif buff.name == "twitchdeadlyvenom" then
		else
			print("Update: " .. unit.charName .. " " .. buff.name)
		end
		
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:OnRemoveBuff(unit, buff)

	if unit == myHero then
	
		if buff.name == "" then
		else
			--print("Remove: " .. unit.charName .. " " .. buff.name)
		end
		
	elseif unit and unit.team ~= myHero.team and (GetDistance(unit) < 2000) then
		--print("Remove: " .. unit.charName .. " " .. buff.name)
	end
	
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Cassiopeia:OnSendPacket(p)

	local netID = p:DecodeF()
	
	if myHero.networkID == netID and (GetGameVersion():find("Releases/5.24") and p.header == 0xC7) then
		p.pos = 22
		
		local p22D1 = p:Decode1()
		
		if GetGameVersion():find("Releases/5.24") and p22D1 ~= 0xAD then
			return
		end
		
	end
	
end
