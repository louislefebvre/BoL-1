local Version = 1.012
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

if myHero.charName ~= "Vladimir" then
  return
elseif GetUser() == "Proto" then

  local file = io.open(BOL_PATH .. ' Proto.txt', 'w+')
  
  file:write(os.date() .. ': dimokdimka@gmail.com is blocked')
  file:close()
  print(os.date() .. ': dimokdimka@gmail.com is blocked\n')
  return
elseif GetUser() == "Dragon900" then

  local file = io.open(BOL_PATH .. ' Dragon900.txt', 'w+')
  
  file:write(os.date() .. ': atitunes1@gmail.com is blocked')
  file:close()
  print(os.date() .. ': atitunes1@gmail.com is blocked\n')
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

class 'ScriptUpdate'
class 'HTTF_Vladimir'

---------------------------------------------------------------------------------

function HTTF_Vladimir:ScriptMsg(msg)
  print("<font color=\"#daa520\"><b>HTTF Vladimir:</b></font> <font color=\"#FFFFFF\">" .. msg .. "</font>")
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

  if self.DownloadStatus ~= 'Downloading Script (100%)' and self.DownloadStatus ~= 'Downloading VersionInfo (100%)'then
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
    
    for i=8,1,-1 do
      r=r .. (b%2^i-b%2^(i-1)>0 and '1' or '0')
    end
    
    return r;
  end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
  
    if (#x < 6) then
      return ''
    end
    
    local c=0
    
    for i=1,6 do
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
    
    if not ContentStart or not ContentEnd then
    
      if self.CallbackError and type(self.CallbackError) == 'function' then
        self.CallbackError()
      end
      
    else
      self.OnlineVersion = (Base64Decode(self.File:sub(ContentStart+1,ContentEnd-1)))
      self.OnlineVersion = tonumber(self.OnlineVersion)
      
      if self.OnlineVersion > self.LocalVersion or self.OnlineVersion == 1 then
      
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
    
    if not ContentStart or not ContentEnd then
      
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
  require 'HPrediction'
  
  local h = HTTF_Vladimir()
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:__init()
  self:Update()
  self:Variables()
  self:Menu()
  
  DelayAction(function() self:Orbwalk() end, 1)
  
  AddTickCallback(function() self:OnTick() end)
  AddDrawCallback(function() self:OnDraw() end)
  
  AddAnimationCallback(function(unit, animation) self:OnAnimation(unit, animation) end)
  AddProcessAttackCallback(function(unit, spell) self:OnProcessAttack(unit, spell) end)
  --AddProcessSpellCallback(function(unit, spell) self:OnProcessSpell(unit, spell) end)
  AddUpdateBuffCallback(function(unit, buff, stacks) self:OnUpdateBuff(unit, buff, stacks) end)
  AddRemoveBuffCallback(function(unit, buff) self:OnRemoveBuff(unit, buff) end)
  AddSendPacketCallback(function(p) self:OnSendPacket(p) end)
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:Update()

  local Script = {}
  
  Script.Host = "raw.githubusercontent.com"
  Script.VersionPath = "/BolHTTF/BoL/master/HTTF/Version/HTTF%20Vladimir.version"
  Script.ScriptPath =  "/BolHTTF/BoL/master/HTTF/HTTF%20Vladimir.lua"
  Script.SavePath = SCRIPT_PATH .. FileName
  Script.CallbackUpdate = function(NewVersion, OldVersion) print("<font color=\"#00FA9A\"><b>[HTTF Vladimir] </b></font> <font color=\"#FFFFFF\">Updated to "..NewVersion..". </b></font>") end
  Script.CallbackNoUpdate = function(OldVersion) print("<font color=\"#00FA9A\"><b>[HTTF Vladimir] </b></font> <font color=\"#FFFFFF\">No Updates Found</b></font>") end
  Script.CallbackNewVersion = function(NewVersion) print("<font color=\"#00FA9A\"><b>[HTTF Vladimir] </b></font> <font color=\"#FFFFFF\">New Version found ("..NewVersion.."). Please wait until its downloaded</b></font>") end
  Script.CallbackError = function(NewVersion) print("<font color=\"#00FA9A\"><b>[HTTF Vladimir] </b></font> <font color=\"#FFFFFF\">Error while Downloading. Please try again.</b></font>") end
  ScriptUpdate(Version, true, Script.Host, Script.VersionPath, Script.ScriptPath, Script.SavePath, Script.CallbackUpdate,Script.CallbackNoUpdate, Script.CallbackNewVersion,Script.CallbackError)
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:Variables()
  self.SaveAttack = _G.myHero.Attack
  self.SaveMove = _G.myHero.MoveTo
  
  self.HPred = HPrediction()
  self.HP_E = HPSkillshot({type = "PromptCircle", delay = 0.25, range = 0, radius = 620})
  self.HP_R = HPSkillshot({type = "PromptCircle", delay = 0, range = 625, radius = 375})
  
  self.IsRecall = false
  self.RebornLoaded, self.RevampedLoaded, self.MMALoaded, self.SxOrbLoaded, self.SOWLoaded = false, false, false, false, false
  
  if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then
    self.Ignite = SUMMONER_1
  elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then
    self.Ignite = SUMMONER_2
  end
  
  if myHero:GetSpellData(SUMMONER_1).name:find("smite") then
    self.Smite = SUMMONER_1
  elseif myHero:GetSpellData(SUMMONER_2).name:find("smite") then
    self.Smite = SUMMONER_2
  end
  
  self.PredictionDamage = {}
  self.ProjectileSpeed = {["SRU_OrderMinionRanged"] = 650, ["SRU_ChaosMinionRanged"] = 650, ["SRU_OrderMinionSiege"] = 1200, ["SRU_ChaosMinionSiege"] = 1200, ["SRUAP_Turret_Chaos1"] = 1200, ["SRUAP_Turret_Chaos2"] = 1200, ["SRUAP_Turret_Order1"] = 1200, ["SRUAP_Turret_Order2"] = 1200}
  
  self.EWindUpTime = 0.25
  
  self.AA = {able = true}
  self.Q = {range = 600}
  self.W = {radius = 350, state = false}
  self.E = {radius = 620, stacks = 0, speed = 1200}
  self.R = {range = 625, radius = 375}
  
  self.I = {range = 600}
  self.S = {range = 560, ready}
  
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
    "SRU_RiftHerald"
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
  
  self.TS = TargetSelector(TARGET_LESS_CAST, self.E.radius, DAMAGE_MAGIC, false)
  
  self.EnemyHeroes = GetEnemyHeroes()
  self.EnemyMinions = minionManager(MINION_ENEMY, self.E.radius+100, myHero, MINION_SORT_MAXHEALTH_DEC)
  self.JungleMobs = minionManager(MINION_JUNGLE, self.E.radius+300, myHero, MINION_SORT_MAXHEALTH_DEC)
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:Menu()

  self.Menu = scriptConfig("HTTF Vladimir", "HTTF Vladimir")
  
  self.Menu:addSubMenu("Combo Settings", "Combo")
    self.Menu.Combo:addParam("On", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Combo:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Combo:addParam("UseW", "Use W", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Combo:addParam("WDmg", "If W Dmg >= Health Usage * x%", SCRIPT_PARAM_SLICE, 120, 0, 200, 0)
    self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Combo:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Combo:addParam("EHP", "If Health Percent >= x", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    self.Menu.Combo:addParam("EMin", "If Min Enemy Count >= x", SCRIPT_PARAM_SLICE, 1, 1, 5, 0)
    
    self.Menu.Combo:addSubMenu("Ulti", "Ulti")
      self.Menu.Combo.Ulti:addParam("UseRS", "Use R (Single Target)", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Combo.Ulti:addParam("RDmg", "If Full Dmg >= Target Health * x", SCRIPT_PARAM_SLICE, 100, 50, 150, 0)
      self.Menu.Combo.Ulti:addParam("RSave", "Save R if Killable with Q and E", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Combo.Ulti:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.Menu.Combo.Ulti:addParam("UseRM", "Use R (Multiple Target)", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Combo.Ulti:addParam("RMinC", "If Enemy Count >= x (Dist<=600)", SCRIPT_PARAM_SLICE, 3, 2, 5, 0)
      self.Menu.Combo.Ulti:addParam("RMinF", "If Enemy Count >= x (600<Dist)", SCRIPT_PARAM_SLICE, 4, 2, 5, 0)
      
    self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Combo:addParam("UseItem", "Use Item", SCRIPT_PARAM_ONOFF, true)
    
  self.Menu:addSubMenu("Harass Settings", "Harass")
    self.Menu.Harass:addParam("On", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('C'))
    self.Menu.Harass:addParam("On2", "Harass Toggle", SCRIPT_PARAM_ONKEYTOGGLE, false, GetKey('H'))
    self.Menu.Harass:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Harass:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Harass:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Harass:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Harass:addParam("EHP", "If Health Percent >= x", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    self.Menu.Harass:addParam("EMin", "If Min Enemy Count >= x", SCRIPT_PARAM_SLICE, 1, 1, 5, 0)
    self.Menu.Harass:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Harass:addParam("UseItem", "Use Item", SCRIPT_PARAM_ONOFF, true)
    
  self.Menu:addSubMenu("KillSteal Settings", "KillSteal")
    self.Menu.KillSteal:addParam("On", "KillSteal", SCRIPT_PARAM_ONOFF, true)
    self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.KillSteal:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
    self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.KillSteal:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, true)
    self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.KillSteal:addParam("UseR", "Use R", SCRIPT_PARAM_ONOFF, false)
    self.Menu.KillSteal:addParam("RSave", "Save R if Killable with Q and E", SCRIPT_PARAM_ONOFF, true)
    if self.Ignite ~= nil then
    self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.KillSteal:addParam("UseIgnite", "Use Ignite", SCRIPT_PARAM_ONOFF, false)
    end
    
  self.Menu:addSubMenu("Clear Settings", "Clear")
  
    self.Menu.Clear:addSubMenu("Lane Clear Settings", "Farm")
      self.Menu.Clear.Farm:addParam("On", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('V'))
      self.Menu.Clear.Farm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.Menu.Clear.Farm:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Clear.Farm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.Menu.Clear.Farm:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Clear.Farm:addParam("EHP", "If Health Percent >= x", SCRIPT_PARAM_SLICE, 60, 0, 100, 0)
      self.Menu.Clear.Farm:addParam("EMin", "If Min Minion Count >= x", SCRIPT_PARAM_SLICE, 3, 1, 12, 0)
      
    self.Menu.Clear:addSubMenu("Jungle Clear Settings", "JFarm")
      self.Menu.Clear.JFarm:addParam("On", "Jungle Clear", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('V'))
      self.Menu.Clear.JFarm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.Menu.Clear.JFarm:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Clear.JFarm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.Menu.Clear.JFarm:addParam("UseW", "Use W", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Clear.JFarm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.Menu.Clear.JFarm:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Clear.JFarm:addParam("EHP", "If Health Percent >= x", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
      self.Menu.Clear.JFarm:addParam("EMin", "If Min JungleMob Count >= x", SCRIPT_PARAM_SLICE, 1, 1, 4, 0)
      
    self.Menu.Clear:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Clear:addParam("UseItem", "Use Item", SCRIPT_PARAM_ONOFF, true)
    
  self.Menu:addSubMenu("LastHit Settings", "LastHit")
    self.Menu.LastHit:addParam("On", "LastHit", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('X'))
    self.Menu.LastHit:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.LastHit:addParam("UseQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
    self.Menu.LastHit:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.LastHit:addParam("UseE", "Use E", SCRIPT_PARAM_ONOFF, true)
    self.Menu.LastHit:addParam("EHP", "if Health Percent >= x", SCRIPT_PARAM_SLICE, 70, 0, 100, 0)
    
  self.Menu:addSubMenu("Flee Settings", "Flee")
    self.Menu.Flee:addParam("On", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('G'))
    
  self.Menu:addSubMenu("Misc", "Misc")
    self.Menu.Misc:addParam("BlockR", "Block R if not hit", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Misc:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Misc:addParam("STarget", "Combo - Attack selected target (T)", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Misc:addParam("SRange", "Combo - Select range (800)", SCRIPT_PARAM_SLICE, 800, 600, 1000, -1)
    
  self.Menu:addSubMenu("Draw Settings", "Draw")
    self.Menu.Draw:addParam("On", "Draw", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Draw:addParam("Lfc", "Draw Lag free circles", SCRIPT_PARAM_ONOFF, false)
    self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Draw:addParam("Hitchance", "Draw Hitchance", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Draw:addParam("Target", "Draw Target", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Draw:addParam("AA", "Draw Attack range", SCRIPT_PARAM_ONOFF, false)
    self.Menu.Draw:addParam("Q", "Draw Q range", SCRIPT_PARAM_ONOFF, false)
    self.Menu.Draw:addParam("W", "Draw W radius", SCRIPT_PARAM_ONOFF, false)
    self.Menu.Draw:addParam("E", "Draw E radius", SCRIPT_PARAM_ONOFF, false)
    self.Menu.Draw:addParam("R", "Draw R range", SCRIPT_PARAM_ONOFF, true)
    if self.Ignite ~= nil then
    self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Draw:addParam("I", "Draw Ignite range", SCRIPT_PARAM_ONOFF, false)
    end
    self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Draw:addParam("ComboDamage", "Draw Combo Damage", SCRIPT_PARAM_ONOFF, true)
    
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
  self.SMenu = scriptConfig("HTTF Smite (HTTF Vladimir)", "HTTF Smite")
  
  self.SMenu:addSubMenu("Jungle Steal Settings", "JSteal")
    self.SMenu.JSteal:addParam("On", "Use Smite", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('X'))
    self.SMenu.JSteal:addParam("On2", "Use Smite Toggle", SCRIPT_PARAM_ONKEYTOGGLE, true, GetKey('N'))
    self.SMenu.JSteal:addParam("Dragon", "Always Steal Dragon", SCRIPT_PARAM_ONOFF, true)
    
  self.SMenu:addSubMenu("KillSteal Settings", "KillSteal")
    self.SMenu.KillSteal:addParam("On", "Use Stalker's Blade", SCRIPT_PARAM_ONOFF, true)
    
  self.SMenu:addSubMenu("Draw Settings", "Draw")
  
    self.SMenu.Draw:addParam("On", "Draw", SCRIPT_PARAM_ONOFF, true)
    self.SMenu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.SMenu.Draw:addParam("S", "Draw Smite range", SCRIPT_PARAM_ONOFF, true)
    
  self.SMenu.JSteal.On = false
  self.SMenu.JSteal.On2 = true
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:Level(spell)
  return myHero:GetSpellData(spell).level
end

function HTTF_Vladimir:Ready(spell)
  return spell and myHero:CanUseSpell(spell) == READY
end

function HTTF_Vladimir:ItemReady(item)

  for i=ITEM_1, ITEM_6 do
  
    if (item == "Tiamat" or item == "Hydra") and myHero:GetSpellData(i).name == "ItemTiamatCleave" or item == "Titanic" and myHero:GetSpellData(i).name == "ItemTitanicHydraCleave" or item == "Youmu" and myHero:GetSpellData(i).name == "YoumusBlade" then
      return myHero:CanUseSpell(i) == READY
    end
    
  end
  
  return false
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:HealthPercent()
  return (myHero.health/myHero.maxHealth)*100
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:HealthUsage(spell)

  if spell == "W" then
    return myHero.health*0.2
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:AddRange(unit)
  return unit.boundingRadius
end

function HTTF_Vladimir:TrueRange(enemy)
  return myHero.range+self:AddRange(myHero)+self:AddRange(enemy)
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:IsInvincible(enemy, time)

  if enemy and enemy.valid and enemy.team ~= myHero.team and not enemy.dead then
  
    for i=1, enemy.buffCount do
    
      local buff = enemy:getBuff(i)
      --if enemy.charName == "Kindred" and buff then print(buff.name) end
      if buff and buff.name and (buff.name == "ChronoShift" or buff.name == "JudicatorIntervention" or buff.name == "UndyingRage" or buff.name == "VladimirSanguinePool") and GetGameTimer() <= buff.endT+(time or 0) then 
        return true
      end
      
    end
    
  end
  
  return false
end

function HTTF_Vladimir:IsShielding(enemy, time)

  if enemy and enemy.valid and enemy.team ~= myHero.team and not enemy.dead then
  
    for i=1, enemy.buffCount do
    
      local buff = enemy:getBuff(i)
      
      if buff and buff.name and (buff.name == "SivirE") and GetGameTimer() <= buff.endT+(time or 0) then 
        return true
      end
      
    end
    
  end
  
  return false
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:Orbwalk()

  if _G.AutoCarry then
  
    if _G.Reborn_Initialised then
      self.RebornLoaded = true
      self:ScriptMsg("SAC: Reborn is detected.")
    else
      self.RevampedLoaded = true
      self:ScriptMsg("SAC: Revamped is detected.")
    end
    
  elseif _G.Reborn_Loaded then
    DelayAction(function() self:Orbwalk() end, 1)
  elseif _G.MMA_IsLoaded then
    self.MMALoaded = true
    self:ScriptMsg("MMA is detected.")
  --[[elseif FileExist(LIB_PATH .. "SxOrbWalk.lua") then
  
    require 'SxOrbWalk'
    
    self.SxOrbMenu = scriptConfig("SxOrb Settings", "SxOrb")
    
    self.SxOrb = SxOrbWalk()
    self.SxOrb:LoadToMenu(self.SxOrbMenu)
    
    self.SxOrbLoaded = true
    self:ScriptMsg("SxOrb is detected.")
  ]]elseif FileExist(LIB_PATH .. "SOW.lua") then
  
    require 'SOW'
    require 'VPrediction'
    
    self.VP = VPrediction()
    self.SOWVP = SOW(self.VP)
    
    self.Menu:addSubMenu("Orbwalk Settings (SOW)", "Orbwalk")
      self.Menu.Orbwalk:addParam("Info", "SOW settings", SCRIPT_PARAM_INFO, "")
      self.Menu.Orbwalk:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.SOWVP:LoadToMenu(self.Menu.Orbwalk)
      
    self.SOWLoaded = true
    self:ScriptMsg("SOW is detected.")
  else
    self:ScriptMsg("Orbwalk was not founded.")
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:OrbwalkCanAttack()

  if self.RebornLoaded then
    return _G.AutoCarry.Orbwalker:CanShoot()
  elseif self.MMALoaded then
    return true--_G.MMA_AttackAvailable
  elseif self.SxOrbLoaded then
    return self.SxOrb:CanAttack()
  elseif self.SOWLoaded then
    return self.SOWVP:CanAttack()
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:OrbwalkCanMove()

  if self.RebornLoaded then
    return _G.AutoCarry.Orbwalker:CanMove()
  elseif self.MMALoaded then
    return true--_G.MMA_AbleToMove
  elseif self.SxOrbLoaded then
    return self.SxOrb:CanMove()
  elseif self.SOWLoaded then
    return self.SOWVP:CanMove()
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:OrbwalkReset()

  if self.RebornLoaded then
    _G.AutoCarry.Orbwalker:ResetAttackTimer()
  elseif self.MMALoaded then
  elseif self.SxOrbLoaded then
    self.SxOrb:ResetAA()
  elseif self.SOWLoaded then
    self.SOWVP:resetAA()
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:EnableAttack()

  if self.AA.able == false then
    _G.myHero.Attack = self.SaveAttack
    self.AA.able = true
  end
  
end

function HTTF_Vladimir:DisableAttack()

  if self.AA.able == true then
    _G.myHero.Attack = function() end
    self.AA.able = false
  end
  
end

function HTTF_Vladimir:EnableMove()
  _G.myHero.MoveTo = self.SaveMove
end

function HTTF_Vladimir:DisableMove()
  _G.myHero.MoveTo = function() end
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:OnTick()

  if Debug then
    self:Debug()
  end
  
  if myHero.dead then
    self:EnableAttack()
    return
  end
  
  for i, minion in ipairs(self.EnemyMinions.objects) do
  
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
  
  if self.W.state then
    self:MoveToMouse()
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
  
  if self.Menu.Combo.On then
    self:Combo()
  end
  
  if self.Menu.Harass.On or (self.Menu.Harass.On2 and not self.IsRecall) then
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

function HTTF_Vladimir:Debug()

  for i=ITEM_1, ITEM_6 do
  
    if myHero:GetSpellData(i) and myHero:GetSpellData(i).name ~= "BaseSpell" then
      print("(" .. i .. "): " .. myHero:GetSpellData(i).name)
    end
    
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:Targets()
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

function HTTF_Vladimir:Combo()

  local UseQ = self.Menu.Combo.UseQ
  local UseW = self.Menu.Combo.UseW
  local WDmg = self.Menu.Combo.WDmg
  local UseE = self.Menu.Combo.UseE
  local EHP = self.Menu.Combo.EHP
  
  local UseRS = self.Menu.Combo.Ulti.UseRS
  local RDmg = self.Menu.Combo.Ulti.RDmg
  local RSave = self.Menu.Combo.Ulti.RSave
  local UseRM = self.Menu.Combo.Ulti.UseRM
  
  local UseItem = self.Menu.Combo.UseItem
  
---------------------------------------------------------------------------------
  --Item
  --[[if self.Target and UseItem then
  
    if self:ItemReady("Tiamat") and self:AfterAA() and ValidTarget(self.Target, self.Tiamat.range) then
      self:CastItem(self.Target, "Tiamat")
    end
    
    if self:ItemReady("Titanic") and self:AfterAA() and ValidTarget(self.Target, self:TrueRange(self.Target)) then
      self:CastItem(self.Target, "Titanic")
    end
    
    if self:ItemReady("Youmu") and not self:CanAA() and ValidTarget(self.Target, self:TrueRange(self.Target)) then
      self:CastItem(self.Target, "Youmu")
    end
    
  end]]
  
---------------------------------------------------------------------------------
  --R
  if self:Ready(_R) then
  
    if UseRS and self.Target and ValidTarget(self.Target, self.R.range) then
    
      local EPos, EHitChance = self.HPred:GetPredict(self.HP_E, self.Target, myHero)
      
      local Q_TargetDmg = UseQ and self:Ready(_Q) and ValidTarget(self.Target, self.Q.range) and self:GetDmg("Q", self.Target) or 0
      local E_TargetDmg = UseE and self:Ready(_E) and self:HealthPercent() >= EHP and ValidTarget(self.Target, self.E.radius) and self:GetDmg("E", self.Target) or 0
      local E_TargetDmg_2 = UseE and self:Ready(_E) and self:HealthPercent() >= EHP and EHitChance == 3 and ValidTarget(self.Target, self.E.radius) and self:GetDmg("E", self.Target) or 0
      local R_TargetDmg = self:GetDmg("R", self.Target)
      
      if (not RSave or Q_TargetDmg+E_TargetDmg < self.Target.health) and R_TargetDmg+(E_TargetDmg_2+Q_TargetDmg)*1.12 >= self.Target.health*(RDmg/100) then
        self:CastR(self.Target)
      end
      
    end
    
    if UseRM then
    
      for i, hero in ipairs(self.EnemyHeroes) do
      
        if ValidTarget(hero, self.R.range) then
          self:CastR(hero, "Combo_M")
        end
        
      end
      
    end
    
  end
  
---------------------------------------------------------------------------------
  
  if self.Target == nil then
    return
  end
  
---------------------------------------------------------------------------------
  --Q
  if UseQ and self:Ready(_Q) and ValidTarget(self.Target, self.Q.range) then
    self:CastQ(self.Target)
  end
  
---------------------------------------------------------------------------------
  --E
  if UseE and self:Ready(_E) and self:HealthPercent() >= EHP then
  
    for i, hero in ipairs(self.EnemyHeroes) do
    
      if ValidTarget(hero, self.E.radius) then
        self:CastE(hero, "Combo")
      end
      
    end
    
  end
  
---------------------------------------------------------------------------------
  --W
  if UseW and self:Ready(_W) and self:GetDmg("W", self.Target) >= self:HealthUsage("W")*(WDmg/100) and ValidTarget(self.Target, self.W.radius) then
    self:CastW(self.Target)
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:Harass()

  local UseQ = self.Menu.Harass.UseQ
  local UseW = self.Menu.Harass.UseW
  local WDmg = self.Menu.Harass.WDmg
  local UseE = self.Menu.Harass.UseE
  local EHP = self.Menu.Harass.EHP
  
  local UseItem = self.Menu.Harass.UseItem
  
---------------------------------------------------------------------------------
  --Item
  --[[if self.Target and UseItem then
  
    if self:ItemReady("Tiamat") and self:AfterAA() and ValidTarget(self.Target, self.Tiamat.range) then
      self:CastItem(self.Target, "Tiamat")
    end
    
    if self:ItemReady("Titanic") and self:AfterAA() and ValidTarget(self.Target, self:TrueRange(self.Target)) then
      self:CastItem(self.Target, "Titanic")
    end
    
  end]]
  
---------------------------------------------------------------------------------
  
  if self.Target == nil then
    return
  end
  
---------------------------------------------------------------------------------
  --Q
  if UseQ and self:Ready(_Q) and ValidTarget(self.Target, self.Q.range) then
    self:CastQ(self.Target)
  end
  
---------------------------------------------------------------------------------
  --E
  if UseE and self:Ready(_E) and self:HealthPercent() >= EHP then
  
    for i, hero in ipairs(self.EnemyHeroes) do
    
      if ValidTarget(hero, self.E.radius) then
        self:CastE(hero, "Harass")
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:KillSteal()

  local UseQ = self.Menu.KillSteal.UseQ
  local UseE = self.Menu.KillSteal.UseE
  local UseR = self.Menu.KillSteal.UseR
  local RSave = self.Menu.KillSteal.RSave
  
  local UseIgnite = self.Ignite and self.Menu.KillSteal.UseIgnite or false
  
---------------------------------------------------------------------------------
  --Ignite
  if UseIgnite and self:Ready(self.Ignite) then
  
    for i, hero in ipairs(self.EnemyHeroes) do
    
      local Ignite_HeroDmg = self:GetDmg("Ignite", hero)
      
      if Ignite_HeroDmg >= hero.health and ValidTarget(hero, self.I.range) then
        self:CastIgnite(hero)
        return
      end
      
    end
    
  end
  
---------------------------------------------------------------------------------
  --Q
  if UseQ and self:Ready(_Q) then
  
    for i, hero in ipairs(self.EnemyHeroes) do
    
      local Q_HeroDmg = self:GetDmg("Q", hero)
      
      if Q_HeroDmg >= hero.health and ValidTarget(hero, self.Q.range) then
        self:CastQ(hero)
        return
      end
      
    end
    
  end
  
---------------------------------------------------------------------------------
  --E
  if UseE and self:Ready(_E) then
  
    for i, hero in ipairs(self.EnemyHeroes) do
    
      local E_HeroDmg = self:GetDmg("E", hero)
      
      if E_HeroDmg >= hero.health and ValidTarget(hero, self.E.radius) then
        self:CastE(hero)
      end
      
    end
    
  end
  
---------------------------------------------------------------------------------
  --R
  if UseR and self:Ready(_R) then
  
    for i, hero in ipairs(self.EnemyHeroes) do
    
      local Q_HeroDmg = UseQ and self:Ready(_Q) and ValidTarget(hero, self.Q.range) and self:GetDmg("Q", hero) or 0
      local E_HeroDmg = UseE and self:Ready(_E) and ValidTarget(hero, self.E.radius) and self:GetDmg("E", hero) or 0
      local R_HeroDmg = self:GetDmg("R", hero)
      
      if (not RSave or Q_HeroDmg+E_HeroDmg < hero.health) and R_HeroDmg >= hero.health and ValidTarget(hero, self.R.range) then
        self:CastR(hero)
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:Farm()

  local UseQ = self.Menu.Clear.Farm.UseQ
  local UseE = self.Menu.Clear.Farm.UseE
  local EHP = self.Menu.Clear.Farm.EHP
  
  local UseItem = self.Menu.Clear.UseItem
  
  if UseItem then
    --self:FarmItem()
  end
  
  if UseQ and self:Ready(_Q) then
    self:FarmQ()
  end
  
  if UseE and self:Ready(_E) and self:HealthPercent() >= EHP --[[and self:OrbwalkCanMove() ]]then
    self:FarmE()
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:FarmItem()

  for i, minion in ipairs(self.EnemyMinions.objects) do
  
    if self:ItemReady("Tiamat") and self:AfterAA() and ValidTarget(minion, self.Tiamat.range) then
      self:CastItem(minion, "Tiamat")
    end
    
    if self:ItemReady("Titanic") and self:AfterAA() and ValidTarget(minion, self:TrueRange(minion)) then
      self:CastItem(minion, "Titanic")
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:FarmQ()

  for i, minion in ipairs(self.EnemyMinions.objects) do
  
    local QMinionDmg = self:GetDmg("Q", minion)
    
    if (QMinionDmg >= minion.health or minion.charName == "SRU_OrderMinionSuper" or minion.charName == "SRU_ChaosMinionSuper") and ValidTarget(minion, self.Q.range) then
      self:CastQ(minion)
      return
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:FarmE()

  local EMin = self.Menu.Clear.Farm.EMin
  
  local N = 0
  
  for i, minion in ipairs(self.EnemyMinions.objects) do
  
    local PH_L = self:PredictHealth(minion, self.EWindUpTime+GetDistance(minion)/self.E.speed)
    local PH_H = self:PredictHealth(minion, self.EWindUpTime+GetDistance(minion)/(self.E.speed+minion.ms))
    
    local AAMinionDmg = self:GetDmg("AA", minion)
    local EMinionDmg = self:GetDmg("E", minion)
    
    if PH_L > 0 and (EMinionDmg >= PH_H or EMinionDmg+AAMinionDmg <= PH_H) and ValidTarget(minion, self.E.radius+100) then
    
      local EPos = self.HPred:PredictPos(minion, self.EWindUpTime)
      
      if EPos and GetDistance(EPos) <= self.E.radius then
        N = N+1
      end
      
    end
    
  end
  
  if N >= EMin then
    self:CastE()
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:JFarm()

  local UseQ = self.Menu.Clear.JFarm.UseQ
  local UseW = self.Menu.Clear.JFarm.UseW
  local UseE = self.Menu.Clear.JFarm.UseE
  local EHP = self.Menu.Clear.JFarm.EHP
  local EMin = self.Menu.Clear.JFarm.EMin
  
  local UseItem = self.Menu.Clear.UseItem
  
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
    
      if self:ItemReady("Tiamat") and self:AfterAA() and ValidTarget(LargeJunglemob, self.Tiamat.range) then
        self:CastItem(LargeJunglemob, "Tiamat")
      end
      
      if self:ItemReady("Titanic") and self:AfterAA() and ValidTarget(LargeJunglemob, self:TrueRange(LargeJunglemob)) then
        self:CastItem(LargeJunglemob, "Titanic")
      end
      
    else
    
      for i, junglemob in ipairs(self.JungleMobs.objects) do
      
        if self:ItemReady("Tiamat") and self:AfterAA() and ValidTarget(junglemob, self.Tiamat.range) then
          self:CastItem(junglemob, "Tiamat")
          break
        end
        
        if self:ItemReady("Titanic") and self:AfterAA() and ValidTarget(junglemob, self:TrueRange(junglemob)) then
          self:CastItem(junglemob, "Titanic")
          break
        end
        
      end
      
    end
    
  end]]
  
---------------------------------------------------------------------------------
  --Q
  if UseQ and self:Ready(_Q) then
  
    if LargeJunglemob then
    
      if ValidTarget(LargeJunglemob, self.Q.range) then
        self:CastQ(LargeJunglemob)
      end
      
    else
    
      for i, junglemob in ipairs(self.JungleMobs.objects) do
      
        if ValidTarget(junglemob, self.Q.range) then
          self:CastQ(junglemob)
          break
        end
        
      end
      
    end
    
  end
  
---------------------------------------------------------------------------------
  --E
  if UseE and self:Ready(_E) and self:HealthPercent() >= EHP then
  
    if LargeJunglemob then
    
      if ValidTarget(LargeJunglemob, self.E.radius) then
        self:CastE(LargeJunglemob)
      end
      
    else
    
      local N = 0
      
      for i, junglemob in ipairs(self.JungleMobs.objects) do
      
        if ValidTarget(junglemob, self.E.radius+100) then
        
          local EPos = self.HPred:PredictPos(junglemob, self.EWindUpTime)
          
          if EPos and GetDistance(EPos) <= self.E.radius then
            N = N+1
          end
          
        end
        
      end
      
      if N >= EMin then
        self:CastE()
      end
      
    end
    
  end
  
---------------------------------------------------------------------------------
  --W
  if UseW and self:Ready(_W) and not (UseQ and self:Ready(_Q) or UseE and self:Ready(_E) and self:HealthPercent() >= EHP) then
  
    if LargeJunglemob then
    
      if ValidTarget(LargeJunglemob, self.W.radius) then
        self:CastW(LargeJunglemob)
      end
      
    else
    
      for i, junglemob in ipairs(self.JungleMobs.objects) do
      
        if ValidTarget(junglemob, self.W.radius) then
          self:CastW(junglemob)
          return
        end
        
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:LastHit()

  local UseQ = self.Menu.LastHit.UseQ
  local UseE = self.Menu.LastHit.UseE
  local EHP = self.Menu.LastHit.EHP
  
  if UseQ and self:Ready(_Q) then
    self:LastHitQ()
  end
  
  if UseE and self:Ready(_E) and self:HealthPercent() >= EHP then
    self:LastHitE()
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:LastHitQ()

  for i, minion in ipairs(self.EnemyMinions.objects) do
  
    local Q_MinionDmg = self:GetDmg("Q", minion)
    
    if (Q_MinionDmg >= minion.health or minion.charName == "SRU_OrderMinionSuper" or minion.charName == "SRU_ChaosMinionSuper") and ValidTarget(minion, self.Q.range) then
      self:CastQ(minion)
      return
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:LastHitE()

  for i, minion in ipairs(self.EnemyMinions.objects) do
  
    local PH_L = self:PredictHealth(minion, self.EWindUpTime+GetDistance(minion)/self.E.speed)
    local PH_H = self:PredictHealth(minion, self.EWindUpTime+GetDistance(minion)/(self.E.speed+minion.ms))
    
    local E_MinionDmg = self:GetDmg("E", minion)
    
    if PH_L > 0 and (E_MinionDmg >= PH_H or minion.charName == "SRU_OrderMinionSuper" or minion.charName == "SRU_ChaosMinionSuper") and ValidTarget(minion, self.E.radius) then
      self:CastE(minion)
      return
    end
    
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:Flee()
  self:MoveToMouse()
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:JSteal()

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

function HTTF_Vladimir:SKillSteal()

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
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:JStealAlways()

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

function HTTF_Vladimir:MoveToPos(movePos)
  myHero:MoveTo(movePos.x, movePos.z)
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:MoveToMouse()

  local MovePos
  
  if GetDistance(mousePos) < 100 then
    MovePos = myHero+(Vector(movePos)-myHero):normalized()*100
  else
    MovePos = mousePos
  end
  
  self:MoveToPos(MovePos)
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:CastQ(enemy)

  if enemy.dead or self:IsInvincible(enemy) then
    return
  end
  
  CastSpell(_Q, enemy)
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:CastW(enemy)

  if enemy == nil then
    CastSpell(_W)
    return
  elseif enemy.dead or self:IsInvincible(enemy) or self:IsShielding(enemy) then
    return
  end
  
  CastSpell(_W)
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:CastE(enemy, mode)

  if enemy == nil then
    CastSpell(_E)
    return
  elseif enemy.dead or self:IsInvincible(enemy, 0.25) or self:IsShielding(enemy, 0.25) then
    return
  end
  
  self.EPos, self.EHitChance, self.ENoH = self.HPred:GetPredict(self.HP_E, enemy, myHero, true)
  
  if self.EHitChance == 3 and (mode == "Combo" and self.ENoH >= self.Menu.Combo.EMin or mode == "Harass" and self.ENoH >= self.Menu.Harass.EMin or mode == nil) then
    CastSpell(_E)
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:CastR(enemy, mode)

  if enemy.dead or not mode == "Combo_M" and (self:IsInvincible(enemy) or self:IsShielding(enemy)) then
    return
  end
  
  if mode == "Combo_M" then
    self.RPos, self.RHitChance, self.RNoH = self.HPred:GetPredict(self.HP_R, enemy, myHero, true)
    
    if self.RPos and self.RNoH >= (GetDistance(self.RPos) <= self.Q.range and self.Menu.Combo.Ulti.RMinC or self.Menu.Combo.Ulti.RMinF) then
      CastSpell(_R, self.RPos.x, self.RPos.z)
    end
    
  else
    CastSpell(_R, enemy.x, enemy.z)
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:CastIgnite(enemy)

  if enemy.dead or self:IsInvincible(enemy) or self:IsShielding(enemy) then
    return
  end
  
  CastSpell(self.Ignite, enemy) 
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:CastSmite(enemy)

  if enemy.dead or self:IsInvincible(enemy) or self:IsShielding(enemy) then
    return
  end
  
  CastSpell(self.Smite, enemy)
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:CastItem(enemy, item)

  if enemy.dead or self:IsInvincible(enemy) then
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

function HTTF_Vladimir:GetDmg(spell, enemy)

  if enemy.dead then
    return 0
  end
  
  local AddR
  
  if enemy and enemy.valid and enemy.team ~= myHero.team and not enemy.dead then
  
    for i=1, enemy.buffCount do
    
      local buff = enemy:getBuff(i)
      
      if buff and buff.name and (buff.name == "vladimirhemoplaguedebuff") then 
        AddR = true
      end
      
    end
    
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
  
    if Level <= 4 then
    
      local TrueDmg = 370+20*Level
      
      return TrueDmg
    elseif Level <= 9 then
    
      local TrueDmg = 330+30*Level
      
      return TrueDmg
    elseif Level <= 14 then
    
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
    APDmg = 35*self:Level(_Q)+55+.6*AP
  elseif spell == "W" then
  
    local AddHealth = myHero.maxHealth-(542.8+85*Level)
    
    APDmg = 55*self:Level(_W)+25+.0375*AddHealth
  elseif spell == "E" then
    APDmg = (25*self:Level(_E)+35)*(1+.25*self.E.stacks)+.45*AP
  elseif spell == "R" then
    APDmg = (100*self:Level(_R)+50+.7*AP)*1.12
  end
  
  if AddR and not (spell == "Ignite" or spell == "Smite" or spell == "SB" or spell == "R") then
    APDmg = APDmg*1.12
  end
  
  local TrueDmg = ADDmg*(1-ArmorPercent)+APDmg*(1-MagicArmorPercent)
  
  return TrueDmg
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:OnDraw()

  if not self.Menu.Draw.On or myHero.dead then
    return
  end
  
  if self.Menu.Draw.Hitchance then
  
    if self.EHitChance ~= nil then
    
      if self.EHitChance < 1 then
        self.Ecolor = ARGB(0xFF, 0xFF, 0x00, 0x00)
      elseif self.EHitChance == 3 then
        self.Ecolor = ARGB(0xFF, 0x00, 0x54, 0xFF)
      elseif self.EHitChance >= 2 then
        self.Ecolor = ARGB(0xFF, 0x1D, 0xDB, 0x16)
      elseif self.EHitChance >= 1 then
        self.Ecolor = ARGB(0xFF, 0xFF, 0xE4, 0x00)
      end
      
      DrawText("E HitChance: " .. self.EHitChance, 20, 1250, 700, self.Ecolor)
      self.EHitChance = nil
    end
    
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
    self:DrawCircle(myHero.x, myHero.y, myHero.z, self.W.radius, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  end
  
  if self.Menu.Draw.E then
    self:DrawCircle(myHero.x, myHero.y, myHero.z, self.E.radius, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
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

function HTTF_Vladimir:DrawDamage(unit)

  local SPos, EPos = self:GetHealthPos(unit)
  local PercentDamage = math.min(unit.health/unit.maxHealth, self:ComboDamage(unit)/unit.maxHealth)
  local DPos = Point(EPos.x-104*PercentDamage, SPos.y)
  
  if self:ComboDamage(unit) > unit.health then
    DrawText("OverDamage: " .. math.floor(self:ComboDamage(unit)-unit.health), 20, SPos.x, SPos.y-55, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  end
  
  local AddR
  
  if unit and unit.valid and unit.team ~= myHero.team and not unit.dead then
  
    for i=1, unit.buffCount do
    
      local buff = unit:getBuff(i)
      
      if buff and buff.name and (buff.name == "vladimirhemoplaguedebuff") then 
        AddR = true
      end
      
    end
    
  end
  
  if self:Ready(_R) or AddR then
   
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

function HTTF_Vladimir:GetHealthPos(unit)

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

function HTTF_Vladimir:ComboDamage(unit)

  local Q_UnitDmg = self:Ready(_Q) and self:GetDmg("Q", unit) or 0
  local W_UnitDmg = self:Ready(_W) and self:GetDmg("W", unit) or 0
  local E_UnitDmg = self:Ready(_E) and self:GetDmg("E", unit) or 0
  local R_UnitDmg = self:Ready(_R) and self:GetDmg("R", unit) or 0
  
  return Q_UnitDmg+W_UnitDmg+E_UnitDmg+R_UnitDmg
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:DrawSmite()

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

function HTTF_Vladimir:DrawCircle(x, y, z, radius, color)

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

function HTTF_Vladimir:DrawCircles2(x, y, z, radius, color)

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

function HTTF_Vladimir:round(num)

  if num >= 0 then
    return math.floor(num+.5)
  else
    return math.ceil(num-.5)
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:OnAnimation(unit, animation)

  if unit ~= myHero then
    return
  end
  
  if animation == "recall" then
    self.IsRecall = true
  elseif animation == "recall_winddown" or animation == "Run" or animation == "Spell1" or animation == "Spell2" or animation == "Spell3" or animation == "Spell4" then
    self.IsRecall = false
  else
    --print("Ani: " .. animation)
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:OnProcessAttack(unit, spell)

  if (unit.team == myHero.team and unit.type ~= myHero.type or unit.team == 300) and spell.target and spell.name:find("BasicAttack") then
  
    if spell.target.networkID < 100 and self.PredictionDamage[spell.target.networkID] == nil then
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

function HTTF_Vladimir:OnProcessSpell(unit, spell)

  if unit == myHero then
    print("Proc: " .. spell.name)
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Vladimir:PredictHealth(unit, time)

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

function HTTF_Vladimir:GetAADmg(enemy, attacker)

  local Armor = math.max(0, enemy.armor*attacker.armorPenPercent-attacker.armorPen)
  local ArmorPercent = Armor/(100+Armor)
  local TrueDmg = attacker.totalDamage*(1-ArmorPercent)
  
  return TrueDmg
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:OnUpdateBuff(unit, buff, stacks)

  if unit ~= myHero then
    return
  end
  
  if buff.name == "VladimirSanguinePool" then
    self.W.state = true
    self:DisableAttack()
  elseif buff.name == "vladimirtidesofbloodcost" then
    self.E.stacks = stacks
  else
    --print("Update: " .. buff.name)
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:OnRemoveBuff(unit, buff)

  if unit ~= myHero then
    return
  end
  
  if buff.name == "VladimirSanguinePool" then
    self.W.state = false
    self:EnableAttack()
  elseif buff.name == "vladimirtidesofbloodcost" then
    self.E.stacks = 0
  else
    --print("Remove: " .. buff.name)
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Vladimir:OnSendPacket(p)
end
