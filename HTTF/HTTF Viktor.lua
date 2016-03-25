local Version = 1.281

if myHero.charName ~= "Viktor" then
  return
end

class 'ScriptUpdate'
class 'HTTF_Viktor'

require 'HPrediction'

function HTTF_Viktor:ScriptMsg(msg)
  print("<font color=\"#daa520\"><b>HTTF Viktor:</b></font> <font color=\"#FFFFFF\">"..msg.."</font>")
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function ScriptUpdate:__init(LocalVersion,UseHttps, Host, VersionPath, ScriptPath, SavePath, CallbackUpdate, CallbackNoUpdate, CallbackNewVersion,CallbackError)
  self.LocalVersion = LocalVersion
  self.Host = Host
  self.VersionPath = '/BoL/TCPUpdater/GetScript'..(UseHttps and '5' or '6')..'.php?script='..self:Base64Encode(self.Host..VersionPath)..'&rand='..math.random(99999999)
  self.ScriptPath = '/BoL/TCPUpdater/GetScript'..(UseHttps and '5' or '6')..'.php?script='..self:Base64Encode(self.Host..ScriptPath)..'&rand='..math.random(99999999)
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
  print('<font color="#FFFFFF">'..os.clock()..': '..str)
end

function ScriptUpdate:OnDraw()

  if self.DownloadStatus ~= 'Downloading Script (100%)' and self.DownloadStatus ~= 'Downloading VersionInfo (100%)'then
    DrawText('Download Status: '..(self.DownloadStatus or 'Unknown'),50,10,50,ARGB(0xFF,0xFF,0xFF,0xFF))
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
      r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0')
    end
    
    return r;
  end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
  
    if (#x < 6) then
      return ''
    end
    
    local c=0
    
    for i=1,6 do
      c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0)
    end
    
    return b:sub(c+1,c+1)
  end)..({ '', '==', '=' })[#data%3+1])
  
end

function ScriptUpdate:GetOnlineVersion()

  if self.GotScriptVersion then
    return
  end
  
  self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
  
  if self.Status == 'timeout' and not self.Started then
    self.Started = true
    self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: sx-bol.eu\r\n\r\n")
  end
  
  if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
    self.RecvStarted = true
    self.DownloadStatus = 'Downloading VersionInfo (0%)'
  end
  
  self.File = self.File .. (self.Receive or self.Snipped)
  
  if self.File:find('</s'..'ize>') then
  
    if not self.Size then
      self.Size = tonumber(self.File:sub(self.File:find('<si'..'ze>')+6,self.File:find('</si'..'ze>')-1))
    end
    
    if self.File:find('<scr'..'ipt>') then
    
      local _,ScriptFind = self.File:find('<scr'..'ipt>')
      local ScriptEnd = self.File:find('</scr'..'ipt>')
      
      if ScriptEnd then
        ScriptEnd = ScriptEnd-1
      end
      
      local DownloadedSize = self.File:sub(ScriptFind+1,ScriptEnd or -1):len()
      
      self.DownloadStatus = 'Downloading VersionInfo ('..math.round(100/self.Size*DownloadedSize,2)..'%)'
    end
    
  end
  
  if self.File:find('</scr'..'ipt>') then
    self.DownloadStatus = 'Downloading VersionInfo (100%)'
    
    local a,b = self.File:find('\r\n\r\n')
    
    self.File = self.File:sub(a,-1)
     self.NewFile = ''
    
    for line,content in ipairs(self.File:split('\n')) do
    
      if content:len() > 5 then
        self.NewFile = self.NewFile .. content
      end
      
    end
    
    local HeaderEnd, ContentStart = self.File:find('<scr'..'ipt>')
    local ContentEnd, _ = self.File:find('</sc'..'ript>')
    
    if not ContentStart or not ContentEnd then
    
      if self.CallbackError and type(self.CallbackError) == 'function' then
        self.CallbackError()
      end
      
    else
      self.OnlineVersion = (Base64Decode(self.File:sub(ContentStart+1,ContentEnd-1)))
      self.OnlineVersion = tonumber(self.OnlineVersion)
      
      if self.OnlineVersion > self.LocalVersion then
      
        if self.CallbackNewVersion and type(self.CallbackNewVersion) == 'function' then
          self.CallbackNewVersion(self.OnlineVersion,self.LocalVersion)
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
    self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: sx-bol.eu\r\n\r\n")
  end
  
  if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
    self.RecvStarted = true
    self.DownloadStatus = 'Downloading Script (0%)'
  end
  
  self.File = self.File .. (self.Receive or self.Snipped)
  
  if self.File:find('</si'..'ze>') then
  
    if not self.Size then
      self.Size = tonumber(self.File:sub(self.File:find('<si'..'ze>')+6,self.File:find('</si'..'ze>')-1))
    end
    
    if self.File:find('<scr'..'ipt>') then
    
      local _,ScriptFind = self.File:find('<scr'..'ipt>')
      local ScriptEnd = self.File:find('</scr'..'ipt>')
      
      if ScriptEnd then
        ScriptEnd = ScriptEnd-1
      end
      
      local DownloadedSize = self.File:sub(ScriptFind+1,ScriptEnd or -1):len()
      
      self.DownloadStatus = 'Downloading Script ('..math.round(100/self.Size*DownloadedSize,2)..'%)'
    end
    
  end
  
  if self.File:find('</scr'..'ipt>') then
    self.DownloadStatus = 'Downloading Script (100%)'
    
    local a,b = self.File:find('\r\n\r\n')
    
    self.File = self.File:sub(a,-1)
    self.NewFile = ''
    
    for line,content in ipairs(self.File:split('\n')) do
    
      if content:len() > 5 then
        self.NewFile = self.NewFile .. content
      end
      
    end
    
    local HeaderEnd, ContentStart = self.NewFile:find('<sc'..'ript>')
    local ContentEnd, _ = self.NewFile:find('</scr'..'ipt>')
    
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
          self.CallbackUpdate(self.OnlineVersion,self.LocalVersion)
        end
        
      end
      
    end
    
    self.GotScriptUpdate = true
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function OnLoad()

  HTTF_Viktor = HTTF_Viktor()
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Viktor:__init()
  self:Update()
  self:Variables()
  self:Menu()
  
  DelayAction(function() self:Orbwalk() end, 1)
  AddTickCallback(function() self:Tick() end)
  AddDrawCallback(function() self:Draw() end)
  AddAnimationCallback(function(unit, animation) self:Animation(unit, animation) end)
  AddCreateObjCallback(function(object) self:CreateObj(object) end)
  AddDeleteObjCallback(function(object) self:DeleteObj(object) end)
  AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
end

---------------------------------------------------------------------------------

function HTTF_Viktor:Update()

  local ToUpdate = {}
  
  ToUpdate.Host = "raw.githubusercontent.com"
  ToUpdate.VersionPath = "/BolHTTF/BoL/master/HTTF/Version/HTTF%20Viktor.version"
  ToUpdate.ScriptPath =  "/BolHTTF/BoL/master/HTTF/HTTF%20Viktor.lua"
  ToUpdate.SavePath = SCRIPT_PATH .. GetCurrentEnv().FILE_NAME
  ToUpdate.CallbackUpdate = function(NewVersion, OldVersion) print("<font color=\"#00FA9A\"><b>[HTTF Viktor] </b></font> <font color=\"#FFFFFF\">Updated to "..NewVersion..". </b></font>") end
  ToUpdate.CallbackNoUpdate = function(OldVersion) print("<font color=\"#00FA9A\"><b>[HTTF Viktor] </b></font> <font color=\"#FFFFFF\">No Updates Found</b></font>") end
  ToUpdate.CallbackNewVersion = function(NewVersion) print("<font color=\"#00FA9A\"><b>[HTTF Viktor] </b></font> <font color=\"#FFFFFF\">New Version found ("..NewVersion.."). Please wait until its downloaded</b></font>") end
  ToUpdate.CallbackError = function(NewVersion) print("<font color=\"#00FA9A\"><b>[HTTF Viktor] </b></font> <font color=\"#FFFFFF\">Error while Downloading. Please try again.</b></font>") end
  ScriptUpdate(Version, true, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate,ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion,ToUpdate.CallbackError)
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Viktor:Variables()

  self.HPred = HPrediction()
  --self.HPred_W = HPSkillshot({type = "PromptCircle", delay = 1--[[1.5]]+0.6, range = 700, radius = function() return 325*(100/(100-(4*self:Level(_W)+24))) end, IsVeryLowAccuracy = true})
  self.HPred_R = HPSkillshot({type = "PromptCircle", delay = 0.27, range = 700, radius = 325})
  
  self.IsRecall = false
  self.LastFollow = 0
  self.LastFarmE = 0
  self.LastJFarmE = 0
  self.LastRTarget = nil
  self.RebornLoaded, self.RevampedLoaded, self.MMALoaded, self.SxOrbLoaded, self.SOWLoaded = false, false, false, false, false
  self.Storm = nil
  
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
  
  self.Q = {range = 700, ready}
  self.W = {range = 700, radius = 325, ready}
  self.E = {range1 = 550, range2 = 700, width = 160, ready}
  self.R = {range = 700, radius = 325, ready}
  self.I = {range = 600, ready}
  self.S = {range = 760, ready}
  
  self.ERange = self.E.range1+self.E.range2
  
  local S5SR = false
  local TT = false
  
  if GetGame().map.index == 15 then
    S5SR = true
  elseif GetGame().map.index == 4 then
    TT = true
  end
  
  if S5SR then
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
    "SRU_Red10.1.1"
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
  elseif TT then
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
  
  self.QTS = TargetSelector(TARGET_LESS_CAST, self.Q.range, DAMAGE_MAGIC, false)
  self.WTS = TargetSelector(TARGET_CLOSEST, self.W.range, DAMAGE_MAGIC, false)
  self.ETS = TargetSelector(TARGET_LESS_CAST, self.ERange, DAMAGE_MAGIC, false)
  self.STS = TargetSelector(TARGET_LOW_HP, self.S.range)
  
  self.EnemyHeroes = GetEnemyHeroes()
  self.sEnemyMinions = minionManager(MINION_ENEMY, self.E.range1, myHero, MINION_SORT_MAXHEALTH_DEC)
  self.ecEnemyMinions = minionManager(MINION_ENEMY, self.ERange+300, myHero, MINION_SORT_MAXHEALTH_DEC)
  self.JungleMobs = minionManager(MINION_JUNGLE, self.ERange, myHero, MINION_SORT_MAXHEALTH_DEC)
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:Menu()

  self.Menu = scriptConfig("HTTF Viktor", "HTTF Viktor")
  
  self.Menu:addSubMenu("HitChance Settings", "HitChance")
  
    self.Menu.HitChance:addSubMenu("Combo", "Combo")
      self.Menu.HitChance.Combo:addParam("WW", "W HitChacne (Default value = 1.7)", SCRIPT_PARAM_SLICE, 1.7, 1, 3, 2)
      self.Menu.HitChance.Combo:addParam("E", "E HitChacne (Default value = 1.6)", SCRIPT_PARAM_SLICE, 1.6, 1, 3, 2)
      self.Menu.HitChance.Combo:addParam("R", "R HitChacne (Default value = 3)", SCRIPT_PARAM_SLICE, 3, 2, 3, 2)
      
    self.Menu.HitChance:addSubMenu("Harass", "Harass")
      self.Menu.HitChance.Harass:addParam("E", "E HitChacne (Default value = 2)", SCRIPT_PARAM_SLICE, 2, 1, 3, 2)
      
  self.Menu:addSubMenu("Combo Settings", "Combo")
    self.Menu.Combo:addParam("On", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Combo:addParam("W2", "Use W if Mana Percent > x% (25)", SCRIPT_PARAM_SLICE, 25, 0, 100, 0)
    self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Combo:addParam("R2", "Interval of moving R (0.3)", SCRIPT_PARAM_SLICE, .3, 0, 1, 1)
    
  self.Menu:addSubMenu("Clear Settings", "Clear")
  
    self.Menu.Clear:addSubMenu("Lane Clear Settings", "Farm")
      self.Menu.Clear.Farm:addParam("On", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('V'))
      self.Menu.Clear.Farm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.Menu.Clear.Farm:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Clear.Farm:addParam("Q2", "Use Q if Mana Percent > x% (30)", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
      self.Menu.Clear.Farm:addParam("Q3", "Use Q if AA cool down", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Clear.Farm:addParam("Q4", "Use Q just for LastHit", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Clear.Farm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.Menu.Clear.Farm:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Clear.Farm:addParam("Info", "Smart E mana manager", SCRIPT_PARAM_INFO, "")
      self.Menu.Clear.Farm:addParam("EMin", "Min enemies for E (3)", SCRIPT_PARAM_SLICE, 3, 2, 12, 0)
      
    self.Menu.Clear:addSubMenu("Jungle Clear Settings", "JFarm")
      self.Menu.Clear.JFarm:addParam("On", "Jungle Clear", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('V'))
      self.Menu.Clear.JFarm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.Menu.Clear.JFarm:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Clear.JFarm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.Menu.Clear.JFarm:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
      
  self.Menu:addSubMenu("Harass Settings", "Harass")
    self.Menu.Harass:addParam("On", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('C'))
    self.Menu.Harass:addParam("On2", "Harass Toggle", SCRIPT_PARAM_ONKEYTOGGLE, false, GetKey('H'))
    self.Menu.Harass:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Harass:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    
  self.Menu:addSubMenu("LastHit Settings", "LastHit")
    self.Menu.LastHit:addParam("On", "LastHit", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('X'))
    self.Menu.LastHit:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    self.Menu.LastHit:addParam("Q2", "Use Q if Mana Percent > x% (75)", SCRIPT_PARAM_SLICE, 75, 0, 100, 0)
    
  if self.Smite ~= nil then
  self.Menu:addSubMenu("Jungle Steal Settings", "JSteal")
    self.Menu.JSteal:addParam("On", "Jungle Steal", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('X'))
    self.Menu.JSteal:addParam("On2", "Jungle Steal Toggle", SCRIPT_PARAM_ONKEYTOGGLE, true, GetKey('N'))
    self.Menu.JSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.JSteal:addParam("S", "Use Smite", SCRIPT_PARAM_ONOFF, true)
    self.Menu.JSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.JSteal:addParam("Always", "Always Use Smite\n(Baron & Dragon)", SCRIPT_PARAM_ONOFF, true)
  end
  
  self.Menu:addSubMenu("KillSteal Settings", "KillSteal")
    self.Menu.KillSteal:addParam("On", "KillSteal", SCRIPT_PARAM_ONOFF, true)
    self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.KillSteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    self.Menu.KillSteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    self.Menu.KillSteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if self.Ignite ~= nil then
    self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.KillSteal:addParam("I", "Use Ignite", SCRIPT_PARAM_ONOFF, true)
    end
    if self.Smite ~= nil then
    self.Menu.KillSteal:addParam("Blank4", "", SCRIPT_PARAM_INFO, "")
    self.Menu.KillSteal:addParam("S", "Use Stalker's Blade", SCRIPT_PARAM_ONOFF, true)
    end
    
  self.Menu:addSubMenu("Flee Settings", "Flee")
    self.Menu.Flee:addParam("On", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('G'))
    
  if VIP_USER then
  self.Menu:addSubMenu("Misc", "Misc")
    self.Menu.Misc:addParam("BlockR", "Block R if will not hit", SCRIPT_PARAM_ONOFF, true)
  end
  
  self.Menu:addSubMenu("Draw Settings", "Draw")
  
    self.Menu.Draw:addSubMenu("Draw Target", "Target")
      self.Menu.Draw.Target:addParam("Q", "Draw Q Target", SCRIPT_PARAM_ONOFF, false)
      self.Menu.Draw.Target:addParam("W", "Draw W, R Target", SCRIPT_PARAM_ONOFF, false)
      self.Menu.Draw.Target:addParam("E", "Draw E Target", SCRIPT_PARAM_ONOFF, true)
      
    self.Menu.Draw:addSubMenu("Draw Predicted Position & Line", "PP")
      self.Menu.Draw.PP:addParam("E", "Draw E Line", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Draw.PP:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.Menu.Draw.PP:addParam("Line", "Draw Line to Pos", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
        
    self.Menu.Draw:addParam("On", "Draw", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Draw:addParam("Lfc", "Draw Lag free circles", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Draw:addParam("AA", "Draw Attack range", SCRIPT_PARAM_ONOFF, false)
    self.Menu.Draw:addParam("Q", "Draw Q range", SCRIPT_PARAM_ONOFF, false)
    self.Menu.Draw:addParam("W", "Draw W range", SCRIPT_PARAM_ONOFF, false)
    self.Menu.Draw:addParam("E", "Draw E range", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Draw:addParam("R", "Draw R range", SCRIPT_PARAM_ONOFF, true)
    if self.Ignite ~= nil then
    self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Draw:addParam("I", "Draw Ignite range", SCRIPT_PARAM_ONOFF, false)
    end
    if self.Smite ~= nil then
    self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Draw:addParam("S", "Draw Smite range", SCRIPT_PARAM_ONOFF, true)
    end
    self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Draw:addParam("Path", "Draw Move Path", SCRIPT_PARAM_ONOFF, false)
    self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Draw:addParam("Hitchance", "Draw Hitchance", SCRIPT_PARAM_ONOFF, true)
    
  self.Menu.Combo.On = false
  self.Menu.Clear.Farm.On = false
  self.Menu.Clear.JFarm.On = false
  self.Menu.Harass.On = false
  self.Menu.Harass.On2 = false
  self.Menu.LastHit.On = false
  if self.Smite ~= nil then
  self.Menu.JSteal.On = false
  end
  self.Menu.Flee.On = false
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:Orbwalk()

  if _G.AutoCarry then
  
    if _G.Reborn_Initialised then
      self.RebornLoaded = true
      self:ScriptMsg("Found SAC: Reborn.")
    else
      self.RevampedLoaded = true
      self:ScriptMsg("Found SAC: Revamped.")
    end
    
  elseif _G.Reborn_Loaded then
    DelayAction(function() self:Orbwalk() end, 1)
  elseif _G.MMA_IsLoaded then
    self.MMALoaded = true
    self:ScriptMsg("Found MMA.")
  elseif FileExist(LIB_PATH .. "SxOrbWalk.lua") then
  
    require 'SxOrbWalk'
    
    self.SxOrbMenu = scriptConfig("SxOrb Settings", "SxOrb")
    
    self.SxOrb = SxOrbWalk()
    self.SxOrb:LoadToMenu(self.SxOrbMenu)
    
    self.SxOrbLoaded = true
    self:ScriptMsg("Found SxOrb.")
  elseif FileExist(LIB_PATH .. "SOW.lua") then
  
    require 'SOW'
    require 'VPrediction'
    
    self.VP = VPrediction()
    self.SOWVP = SOW(self.VP)
    
    self.Menu:addSubMenu("Orbwalk Settings (SOW)", "Orbwalk")
      self.Menu.Orbwalk:addParam("Info", "SOW settings", SCRIPT_PARAM_INFO, "")
      self.Menu.Orbwalk:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.SOWVP:LoadToMenu(self.Menu.Orbwalk)
      
    self.SOWLoaded = true
    self:ScriptMsg("Found SOW.")
  else
    self:ScriptMsg("Orbwalk not founded.")
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Viktor:Tick()

  if myHero.dead then
    return
  end
  
  self:Checks()
  self:Targets()
  
  if self:Ready(_R) and os.clock()-self.LastFollow > self.Menu.Combo.R2 then
    self:Follow()
  end
  
  if self.Menu.Combo.On then
    self:Combo()
  end
  
  if self.Menu.Clear.Farm.On then
    self:Farm()
  end
  
  if self.Menu.Clear.JFarm.On then
    self:JFarm()
  end
  
  if self.Menu.Harass.On or (self.Menu.Harass.On2 and not self.IsRecall) then
    self:Harass()
  end
  
  if self.Menu.LastHit.On then
    self:LastHit()
  end
  
  if self.Smite ~= nil and (self.Menu.JSteal.On or self.Menu.JSteal.On2) then
    self:JSteal()
  end
  
  if self.Smite ~= nil and self.Menu.JSteal.Always then
    self:JstealAlways()
  end
  
  if self.Menu.KillSteal.On then
    self:KillSteal()
  end
  
  if self.Menu.Flee.On then
    self:Flee()
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:Checks()

  self.sEnemyMinions:update()
  self.ecEnemyMinions:update()
  self.JungleMobs:update()
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:Level(spell)
  return myHero:GetSpellData(spell).level
end

function HTTF_Viktor:Ready(spell)
  return spell and myHero:CanUseSpell(spell) == READY
end

---------------------------------------------------------------------------------

function HTTF_Viktor:Targets()

  self.QTS:update()
  self.WTS:update()
  self.ETS:update()
  self.STS:update()
  
  self.QTarget = self.QTS.target
  self.WTarget = self.WTS.target
  self.ETarget = self.ETS.target
  self.STarget = self.STS.target
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:OrbwalkCanAttack()

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

function HTTF_Viktor:OrbwalkCanMove()

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

function HTTF_Viktor:OrbwalkReset()

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

function HTTF_Viktor:Follow()

  if self.Storm then
  
    if self.LastRTarget and not self.LastRTarget.dead and GetDistance(self.LastRTarget, self.Storm) <= self.R.radius then
      self:FollowR(self.LastRTarget)
      return
    elseif self.WTarget and not self.WTarget.dead and GetDistance(self.WTarget, self.Storm) <= self.R.radius then
      self:FollowR(self.WTarget)
      return
    else
    
      for i, enemy in ipairs(self.EnemyHeroes) do
      
        if not enemy.dead and enemy ~= self.LastRTarget and GetDistance(enemy, self.Storm) <= 500 then
          self:FollowR(enemy)
          return
        end
        
      end
    
      for i, enemy in ipairs(self.EnemyHeroes) do
      
        if not enemy.dead and enemy ~= self.LastRTarget and GetDistance(enemy, self.Storm) <= 2000 then
          self:FollowR(enemy)
          return
        end
        
      end
      
    end
    
    self:FollowR(mousePos)
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:Combo()

  local ComboQ = self.Menu.Combo.Q
  local ComboW = self.Menu.Combo.W
  local ComboW2 = self.Menu.Combo.W2
  local ComboE = self.Menu.Combo.E
  local ComboR = self.Menu.Combo.R
  
  if self.QTarget ~= nil and ComboQ and self:Ready(_Q) and 5*self:Level(_Q)+40 <= myHero.mana and ValidTarget(self.QTarget, self.Q.range) then
    self:CastQ(self.QTarget)
  end
  
  if self.WTarget ~= nil and ComboW and self:Ready(_W) and ComboW2 <= self:ManaPercent() and ValidTarget(self.WTarget, self.W.range) then
    self:CastW(self.WTarget, "Combo")
  end
  
  if ComboE and self:Ready(_E) and 10*self:Level(_E)+60 <= myHero.mana then
  
    for i, enemy in ipairs(self.EnemyHeroes) do
    
      if ValidTarget(enemy, self.ERange) then
        self:CastE(enemy, "Combo")
      end
      
    end
    
  end
  
  if ComboR and self:Ready(_R) and 100 <= myHero.mana then
  
    for i, enemy in ipairs(self.EnemyHeroes) do
    
      local RenemyDmg = self:GetDmg("R", enemy)+10*self:GetDmg("R2", enemy)
      
      if RenemyDmg >= enemy.health and ValidTarget(enemy, self.R.range) then
        self:CastR(enemy, "Combo")
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:Farm()

  local FarmQ = self.Menu.Clear.Farm.Q
  local FarmQ2 = self.Menu.Clear.Farm.Q2
  local FarmQ3 = self.Menu.Clear.Farm.Q3
  local FarmQ4 = self.Menu.Clear.Farm.Q4
  local FarmE = self.Menu.Clear.Farm.E
  local FarmEMin = self.Menu.Clear.Farm.EMin
  
  if FarmQ and self:Ready(_Q) and FarmQ2 <= self:ManaPercent() then
  
    for i, minion in pairs(self.ecEnemyMinions.objects) do
    
      local QMinionDmg = self:GetDmg("Q", minion)
      
      if QMinionDmg >= minion.health and ValidTarget(minion, self.Q.range) and (GetDistance(minion, myHero) <= self:TrueRange(minion) and not(FarmQ3 and self:OrbwalkCanAttack()) or GetDistance(minion, myHero) > self:TrueRange(minion)) then
        self:CastQ(minion)
        return
      end
      
    end
    
    if not FarmQ4 then
    
      for i, minion in pairs(self.ecEnemyMinions.objects) do
      
        local AAMinionDmg = self:GetDmg("AA", sminion)
        local QMinionDmg = self:GetDmg("Q", minion)
        
        if QMinionDmg+2.5*AAMinionDmg <= minion.health and ValidTarget(minion, self.Q.range) and (GetDistance(minion, myHero) <= self:TrueRange(minion) and not self:OrbwalkCanAttack() or GetDistance(minion, myHero) > self:TrueRange(minion)) then
          self:CastQ(minion)
        return
        end
        
      end
      
    end
    
  end
  
  if FarmE and self:Ready(_E) and 10*self:Level(_E)+60 <= myHero.mana and os.clock()-self.LastFarmE >= .25 then
    self.LastFarmE = os.clock()
    
    for i, sminion in pairs(self.sEnemyMinions.objects) do
    
      local EMinionDmg = self:GetDmg("E", sminion)
      
      if not sminion.dead and EMinionDmg >= sminion.health then
      
        for j, eminion in pairs(self.ecEnemyMinions.objects) do
        
          local endPos, HitChance = self.HPred:GetPredict(self.HPred.Presets['Viktor']["E"], eminion, sminion)
          
          if endPos ~= nil and sminion ~= eminion then
          
            local ENoH = 0
            
            for k, minion in pairs(self.ecEnemyMinions.objects) do
            
              if not sminion.dead and GetDistance(minion, sminion) <= self.E.range2+300 and self.HPred:SpellCollision(self.HPred.Presets['Viktor']["E"], minion, sminion, endPos) then
                ENoH = ENoH+1
              end
              
            end
            
            if ENoH >= FarmEMin and ENoH*myHero.mana/(10*self:Level(_E)+60) >= 10 then
              CastSpell3(_E, D3DXVECTOR3(sminion.x, 0, sminion.z), D3DXVECTOR3(endPos.x, 0, endPos.z))
              return
            end
            
          end
          
        end
        
      end
      
    end
    
    for i, sminion in pairs(self.sEnemyMinions.objects) do
    
      local EMinionDmg = self:GetDmg("E", sminion)
      local AAMinionDmg = self:GetDmg("AA", sminion)
      
      if EMinionDmg+2.5*AAMinionDmg <= sminion.health then
      
        for j, eminion in pairs(self.ecEnemyMinions.objects) do
        
          local endPos, HitChance = self.HPred:GetPredict(self.HPred.Presets['Viktor']["E"], eminion, sminion)
          
          if endPos ~= nil and sminion ~= eminion then
          
            local ENoH = 0
            
            for k, minion in pairs(self.ecEnemyMinions.objects) do
            
              if not sminion.dead and GetDistance(minion, sminion) <= self.E.range2+300 and self.HPred:SpellCollision(self.HPred.Presets['Viktor']["E"], minion, sminion, endPos) then
                ENoH = ENoH+1
              end
              
            end
            
            if ENoH >= FarmEMin and ENoH*myHero.mana/(10*self:Level(_E)+60) >= 20 then
              CastSpell3(_E, D3DXVECTOR3(sminion.x, 0, sminion.z), D3DXVECTOR3(endPos.x, 0, endPos.z))
              return
            end
            
          end
          
        end
        
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:JFarm()

  local JFarmQ = self.Menu.Clear.JFarm.Q
  local JFarmE = self.Menu.Clear.JFarm.E
  
  if self:Ready(_Q) and JFarmQ and 5*self:Level(_Q)+40 <= myHero.mana then
  
    for i, junglemob in pairs(self.JungleMobs.objects) do
    
      local LargeJunglemob = nil
      
      for j = 1, #self.FocusJungleNames do
      
        if junglemob.name == self.FocusJungleNames[j] then
          LargeJunglemob = junglemob
          break
        end
        
      end
      
      if LargeJunglemob ~= nil then
    
        if GetDistance(LargeJunglemob, mousePos) <= 1000 and ValidTarget(LargeJunglemob, self.Q.range) then
          self:CastQ(LargeJunglemob)
        end
        
        return
      end
      
    end
    
    for i, junglemob in pairs(self.JungleMobs.objects) do
    
      if ValidTarget(junglemob, self.Q.range) then
        self:CastQ(junglemob)
        return
      end
      
    end
    
  end
  
  if self:Ready(_E) and JFarmE and 10*self:Level(_E)+60 <= myHero.mana then
  
    for i, junglemob in pairs(self.JungleMobs.objects) do
    
      local LargeJunglemob = nil
          
      for j = 1, #self.FocusJungleNames do
      
        if junglemob.name == self.FocusJungleNames[j] then
          LargeJunglemob = junglemob
          break
        end
        
      end
      
      if LargeJunglemob ~= nil then
      
        if GetDistance(LargeJunglemob, mousePos) <= 1000 and ValidTarget(LargeJunglemob, self.ERange) then
        
          for j, ejunglemob in pairs(self.JungleMobs.objects) do
          
            local endPos, HitChance = self.HPred:GetPredict(self.HPred.Presets['Viktor']["E"], ejunglemob, LargeJunglemob)
            
            if endPos ~= nil and LargeJunglemob ~= ejunglemob then
            
              local ENoH = 0
              
              for k, cjunglemob in pairs(self.JungleMobs.objects) do
              
                if GetDistance(cjunglemob, LargeJunglemob) <= self.E.range2+300 and self.HPred:SpellCollision(self.HPred.Presets['Viktor']["E"], cjunglemob, LargeJunglemob, endPos) then
                  ENoH = ENoH+1
                end
                
              end
              
              if ENoH >= 2 then
                CastSpell3(_E, D3DXVECTOR3(LargeJunglemob.x, 0, LargeJunglemob.z), D3DXVECTOR3(endPos.x, 0, endPos.z))
                return
              end
              
            end
            
          end
          
          self:CastE(LargeJunglemob, "JFarm")
        end
        
        return
      end
      
    end
    
    if os.clock()-self.LastJFarmE >= .25 then
      self.LastJFarmE = os.clock()
      
      for i, sjunglemob in pairs(self.JungleMobs.objects) do
      
        if ValidTarget(sjunglemob, self.E.range1) then
        
          for j, ejunglemob in pairs(self.JungleMobs.objects) do
          
            local endPos, HitChance = self.HPred:GetPredict(self.HPred.Presets['Viktor']["E"], ejunglemob, sjunglemob)
            
            if endPos ~= nil and sjunglemob ~= ejunglemob then
            
              local ENoH = 0
              
              for k, cjunglemob in pairs(self.JungleMobs.objects) do
              
                if GetDistance(cjunglemob, sjunglemob) <= self.E.range2+300 and self.HPred:SpellCollision(self.HPred.Presets['Viktor']["E"], cjunglemob, sjunglemob, endPos) then
                  ENoH = ENoH+1
                end
                
              end
              
              if ENoH >= 2 then
                CastSpell3(_E, D3DXVECTOR3(sjunglemob.x, 0, sjunglemob.z), D3DXVECTOR3(endPos.x, 0, endPos.z))
                return
              end
              
            end
            
          end
          
        end
        
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:Harass()

  local HarassQ = self.Menu.Harass.Q
  local HarassE = self.Menu.Harass.E
  
  if self.QTarget ~= nil and HarassQ and self:Ready(_Q) and 5*self:Level(_Q)+40 <= myHero.mana and ValidTarget(self.QTarget, self.Qrange) then
    self:CastQ(self.QTarget)
  end
  
  if self.ETarget ~= nil and HarassE and self:Ready(_E) and 10*self:Level(_E)+60 <= myHero.mana and ValidTarget(self.ETarget, self.Erange) then
    self:CastE(self.ETarget, "Harass")
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:LastHit()

  local LastHitQ = self.Menu.LastHit.Q
  local LastHitQ2 = self.Menu.LastHit.Q2
  
  if LastHitQ and self:Ready(_Q) and LastHitQ2 <= self:ManaPercent() then
  
    for i, minion in pairs(self.ecEnemyMinions.objects) do
    
      local QMinionDmg = self:GetDmg("Q", minion)
      
      if QMinionDmg >= minion.health and ValidTarget(minion, self.Q.range) then
        self:CastQ(minion)
        return
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:JSteal()

  local JStealS = self.Menu.JSteal.S
  
  if self:Ready(self.Smite) and JStealS then
  
    for i, junglemob in pairs(self.JungleMobs.objects) do
          
      local SJunglemobDmg = self:GetDmg("SMITE", junglemob)
      
      for j = 1, #self.FocusJungleNames do
      
        if junglemob.name == self.FocusJungleNames[j] and SJunglemobDmg >= junglemob.health and ValidTarget(junglemob, self.S.range) then
          self:CastS(junglemob)
          return
        end
        
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:JstealAlways()

  if self:Ready(self.Smite) then
  
    for i, junglemob in pairs(self.JungleMobs.objects) do
    
      local SJunglemobDmg = self:GetDmg("SMITE", junglemob)
      
      for j = 1, #self.FocusJungleNames do
      
        if (junglemob.name == "SRU_Baron12.1.1" or junglemob.name == "SRU_Dragon6.1.1") and SJunglemobDmg >= junglemob.health and ValidTarget(junglemob, self.S.range) then
          self:CastS(junglemob)
          return
        end
        
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:KillSteal()

  local KillStealQ = self.Menu.KillSteal.Q
  local KillStealE = self.Menu.KillSteal.E
  local KillStealR = self.Menu.KillSteal.R
  local KillStealI = self.Menu.KillSteal.I
  local KillStealS = self.Menu.KillSteal.S
  
  for i, enemy in ipairs(self.EnemyHeroes) do
  
    local QenemyDmg = self:GetDmg("Q", enemy)
    local EenemyDmg = self:GetDmg("E", enemy)
    local RenemyDmg = self:GetDmg("R", enemy)
    local IenemyDmg = self:GetDmg("IGNITE", enemy)
    
    if KillStealI and self:Ready(self.Ignite) and IenemyDmg >= enemy.health and ValidTarget(enemy, self.I.range) then
      self:CastI(enemy)
    end
    
    if KillStealR and self:Ready(_R) and RenemyDmg >= enemy.health and 100 <= myHero.mana and ValidTarget(enemy, self.R.range) then
      self:CastR(enemy)
      return
    end
    
    if KillStealQ and self:Ready(_Q) and QenemyDmg >= enemy.health and 5*self:Level(_Q)+40 and ValidTarget(enemy, self.Q.range) then
      self:CastQ(enemy, "KillSteal")
      return
    end
    
    if KillStealE and self:Ready(_E) and (EenemyDmg >= enemy.health and 10*self:Level(_E)+60 <= myHero.mana or KillStealQ and self:Ready(_Q) and GetDistance(enemy, myHero) <= self.Q.range and QenemyDmg+EenemyDmg >= enemy.health and 5*self:Level(_Q)+10*self:Level(_E)+100 <= myHero.mana) and ValidTarget(enemy, self.ERange) then
      self:CastE(enemy)
      return
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:Flee()

  self:MoveToMouse()
  
  if self.WTarget ~= nil and self:Ready(_W) and ValidTarget(self.WTarget, self.W.range) then
    self:CastW(self.WTarget)  
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Viktor:AddRange(unit)
  return unit.boundingRadius
end

function HTTF_Viktor:TrueRange(enemy)
  return myHero.range+self:AddRange(myHero)+self:AddRange(enemy)
end

---------------------------------------------------------------------------------

function HTTF_Viktor:HealthPercent(unit)
  return (unit.health/unit.maxHealth)*100
end

function HTTF_Viktor:ManaPercent()
  return (myHero.mana/myHero.maxMana)*100
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Viktor:GetDmg(spell, enemy)

  if enemy.health == 0 then
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
  
  if spell == "IGNITE" then
  
    local TrueDmg = 50+20*Level
    
    return TrueDmg
  elseif spell == "SMITE" then
  
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
    
  elseif spell == "STALKER" then
  
    local TrueDmg = 20+8*Level
    
    return TrueDmg
  elseif spell == "BC" then
    APDmg = 100
  elseif spell == "BRK" then
    ADDmg = math.max(100, .1*enemy.maxHealth)
  elseif spell == "AA" then
    ADDmg = TotalDmg
  elseif spell == "Q" then
    APDmg = 20*self:Level(_Q)+20+.2*AP
  elseif spell == "E" then
    APDmg = 45*self:Level(_E)+25+.7*AP
  elseif spell == "R" then
    APDmg = 100*self:Level(_R)+50+.55*AP
  elseif spell == "R2" then
    APDmg = 15*self:Level(_R)+.1*AP
  end
  
  local TrueDmg = ADDmg*(1-ArmorPercent)+APDmg*(1-MagicArmorPercent)
  
  return TrueDmg
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Viktor:CastQ(unit, mode)

  if unit.dead or unit.health == 0 or mode ~= "KillSteal" and not self:OrbwalkCanMove() then
    return
  end
  
  CastSpell(_Q, unit)
end

---------------------------------------------------------------------------------

function HTTF_Viktor:CastW(unit, mode)

  if unit.dead or unit.health == 0 then
    return
  end
  
  self.WPos, self.WHitChance = self.HPred:GetPredict(self.HPred.Presets['Viktor']["W"], unit, myHero)
  
  if mode == "Combo" and self.WHitChance >= self.Menu.HitChance.Combo.WW or mode == nil and self.WHitChance > 0 then
    CastSpell(_W, self.WPos.x, self.WPos.z)
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:CastE(unit, mode)

  if unit.dead or unit.health == 0 then
    return
  end
  
  if GetDistance(unit, myHero) > self.E.range1-5 then
    self.EStartPos = self:CircleIntersection(myHero, unit, myHero, self.E.range1-5)
  else
    self.EStartPos = Vector(unit.x, unit.y, unit.z)
  end
  
  self.EPos, self.EHitChance = self.HPred:GetPredict(self.HPred.Presets['Viktor']["E"], unit, self.EStartPos)
  
  if mode == "Combo" and self.EHitChance >= self.Menu.HitChance.Combo.E or mode == "Harass" and self.EHitChance >= self.Menu.HitChance.Harass.E or mode == "JFarm" and self.EHitChance > 0 or mode == nil and self.EHitChance > 1 then
    CastSpell3(_E, D3DXVECTOR3(self.EStartPos.x, 0, self.EStartPos.z), D3DXVECTOR3(self.EPos.x, 0, self.EPos.z))
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:CastR(unit, mode)

  if unit.dead or unit.health == 0 then
    return
  end
  
  self.RPos, self.RHitChance = self.HPred:GetPredict(self.HPred_R, unit, myHero)
  
  if mode == "Combo" and self.RHitChance >= self.Menu.HitChance.Combo.R or mode == nil and self.RHitChance > 2 then
    CastSpell(_R, self.RPos.x, self.RPos.z)
    self.LastRTarget = unit
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:FollowR(unit)

  if unit.dead or unit.health == 0 then
    return
  end
  
  local Pos = unit
  
  if unit.hasMovePath and unit.pathCount >= 2 then
  
    local IndexPath = unit:GetPath(unit.pathIndex)
    
    if IndexPath then
      Pos = Pos+(Vector(IndexPath)-Pos):normalized()*unit.ms*0.25
    end
    
  end
  
  CastSpell(_R, Pos.x, Pos.z)
  self.LastFollow = os.clock()-GetLatency()/2000
end

---------------------------------------------------------------------------------

function HTTF_Viktor:CircleIntersection(v1, v2, c, radius)

  assert(VectorType(v1) and VectorType(v2) and VectorType(c) and type(radius) == "number", "HTTF Viktor: CircleIntersection: wrong argument types (<Vector>, <Vector>, <Vector>, integer expected)")
  
  local x1, y1, x2, y2, x3, y3 = v1.x, v1.z or v1.y, v2.x, v2.z or v2.y, c.x, c.z or c.y
  local r = radius
  local xp, yp, xm, ym = nil, nil, nil, nil
  local IsOnSegment = nil
  
  if x1 == x2 then
  
    local B = math.sqrt(r^2-(x1-x3)^2)
    
    xp, yp, xm, ym = x1, y3+B, x1, y3-B
  else
  
    local m = (y2-y1)/(x2-x1)
    local n = y1-m*x1
    local A = x3-m*(n-y3)
    local B = math.sqrt(A^2-(1+m^2)*(x3^2-r^2+(n-y3)^2))
    
    xp, xm = (A+B)/(1+m^2), (A-B)/(1+m^2)
    yp, ym = m*xp+n, m*xm+n
  end
  
  if x1 <= x2 then
    IsOnSegment = x1 <= xp and xp <= x2
  else
    IsOnSegment = x2 <= xp and xp <= x1        
  end
  
  if IsOnSegment then
    return Vector(xp, 0, yp)
  else
    return Vector(xm, 0, ym)
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:CastI(enemy)
  CastSpell(self.Ignite, enemy)
end

---------------------------------------------------------------------------------

function HTTF_Viktor:CastS(enemy)
  CastSpell(self.Smite, enemy)
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Viktor:MoveToMouse()

  if mousePos and GetDistance(mousePos) <= 100 then
    self.MousePos = myHero+(Vector(mousePos)-myHero):normalized()*300
  else
    self.MousePos = mousePos
  end
  
  myHero:MoveTo(self.MousePos.x, self.MousePos.z)
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Viktor:Draw()

  if not self.Menu.Draw.On or myHero.dead then
    return
  end
  
  if self.Storm then
    self:DrawCircles(self.Storm.x, self.Storm.y, self.Storm.z, self.R.radius, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  end
  
  if self.Menu.Harass.On or self.Menu.Harass.On2 then
    DrawText("Harass: On", 20, 1600, 150, ARGB(0xFF, 0xFF, 0x80, 0x80))
  else
    DrawText("Harass: Off", 20, 1600, 150, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  end
  
  if self.Smite ~= nil then
  
    if self.Menu.JSteal.On or self.Menu.JSteal.On2 then
      DrawText("Jungle Steal: On", 20, 1600, 200, ARGB(0xFF, 0x80, 0x80, 0xFF))
    else
      DrawText("Jungle Steal: Off", 20, 1600, 200, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
    end
    
  end
  
  if self.Menu.Draw.Target.W and self.WTarget ~= nil then
    self:DrawCircles(self.WTarget.x, self.WTarget.y, self.WTarget.z, self.W.radius, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  end
  
  if self.Menu.Draw.Target.E and self.ETarget ~= nil then
    self:DrawCircles(self.ETarget.x, self.ETarget.y, self.ETarget.z, self.E.width/2, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  end
  
  if self.WHitChance ~= nil then
  
    if self.WHitChance < 1 then
      self.Wcolor = ARGB(0xFF, 0xFF, 0x00, 0x00)
    elseif self.WHitChance == 3 then
      self.Wcolor = ARGB(0xFF, 0x00, 0x54, 0xFF)
    elseif self.WHitChance >= 2 then
      self.Wcolor = ARGB(0xFF, 0x1D, 0xDB, 0x16)
    elseif self.WHitChance >= 1 then
      self.Wcolor = ARGB(0xFF, 0xFF, 0xE4, 0x00)
    end
  
  end
  
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
  
  end
  
  if self.RHitChance ~= nil then
  
    if self.RHitChance < 1 then
      self.Rcolor = ARGB(0xFF, 0xFF, 0x00, 0x00)
    elseif self.RHitChance == 3 then
      self.Rcolor = ARGB(0xFF, 0x00, 0x54, 0xFF)
    elseif self.RHitChance >= 2 then
      self.Rcolor = ARGB(0xFF, 0x1D, 0xDB, 0x16)
    elseif self.RHitChance >= 1 then
      self.Rcolor = ARGB(0xFF, 0xFF, 0xE4, 0x00)
    end
  
  end
  
  if self.Menu.Draw.PP.E and self.EPos then
  
    self:DrawCircles(self.EStartPos.x, self.EStartPos.y, self.EStartPos.z, self.E.width, ARGB(0xFF, 0xFF, 0x00, 0x00))
    self:DrawCircles(self.EPos.x, self.EPos.y, self.EPos.z, self.E.width/2, self.Ecolor)
    
    if self.Menu.Draw.PP.Line then
      DrawLine3D(self.EStartPos.x, self.EStartPos.y, self.EStartPos.z, self.EPos.x, self.EPos.y, self.EPos.z, 2, self.Ecolor)
    end
    
    self.EPos = nil
  end
  
  if self.Menu.Draw.Hitchance then
  
    if self.WHitChance ~= nil then
      DrawText("W HitChance: "..self.WHitChance, 20, 1250, 550, self.Wcolor)
      self.WHitChance = nil
    end
  
    if self.EHitChance ~= nil then
      DrawText("E HitChance: "..self.EHitChance, 20, 1250, 600, self.Ecolor)
      self.EHitChance = nil
    end
  
    if self.RHitChance ~= nil then
      DrawText("R HitChance: "..self.RHitChance, 20, 1250, 650, self.Rcolor)
      self.RHitChance = nil
    end
    
  end
  
  if self.Menu.Draw.AA then
    self:DrawCircles(myHero.x, myHero.y, myHero.z, myHero.range+self:AddRange(myHero), ARGB(0xFF, 0, 0xFF, 0))
  end
  
  if self.Menu.Draw.Q then
    self:DrawCircles(myHero.x, myHero.y, myHero.z, self.Q.range, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  end
  
  if self.Menu.Draw.W and self:Ready(_W) then
    self:DrawCircles(myHero.x, myHero.y, myHero.z, self.W.range, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  end
  
  if self.Menu.Draw.E then
    self:DrawCircles(myHero.x, myHero.y, myHero.z, self.E.range1, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
    self:DrawCircles(myHero.x, myHero.y, myHero.z, self.ERange, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  end
  
  if self.Menu.Draw.I and self:Ready(self.Ignite) then
    self:DrawCircles(myHero.x, myHero.y, myHero.z, self.I.range, ARGB(0xFF, 0xFF, 0x24, 0x24))
  end
  
  if self.Menu.Draw.S and self:Ready(self.Smite) and (self.Menu.JSteal.On or self.Menu.JSteal.On2) and self.Menu.JSteal.S then
    self:DrawCircles(myHero.x, myHero.y, myHero.z, self.S.range, ARGB(0xFF, 0xFF, 0x14, 0x93))
  end
  
  if self.Menu.Draw.Path then
  
    if myHero.hasMovePath and myHero.pathCount >= 2 then
    
      local IndexPath = myHero:GetPath(myHero.pathIndex)
      
      if IndexPath then
        DrawLine3D(myHero.x, myHero.y, myHero.z, IndexPath.x, IndexPath.y, IndexPath.z, 1, ARGB(255, 255, 255, 255))
      end
      
      for i=myHero.pathIndex, myHero.pathCount-1 do
      
        local Path = myHero:GetPath(i)
        local Path2 = myHero:GetPath(i+1)
        
        DrawLine3D(Path.x, Path.y, Path.z, Path2.x, Path2.y, Path2.z, 1, ARGB(255, 255, 255, 255))
      end
      
    end
    
    for i, enemy in ipairs(self.EnemyHeroes) do
    
      if enemy.hasMovePath and enemy.pathCount >= 2 then
      
        local IndexPath = enemy:GetPath(enemy.pathIndex)
        
        if IndexPath then
          DrawLine3D(enemy.x, enemy.y, enemy.z, IndexPath.x, IndexPath.y, IndexPath.z, 1, ARGB(255, 255, 255, 255))
        end
        
        for i=enemy.pathIndex, enemy.pathCount-1 do
        
          local Path = enemy:GetPath(i)
          local Path2 = enemy:GetPath(i+1)
          
          DrawLine3D(Path.x, Path.y, Path.z, Path2.x, Path2.y, Path2.z, 1, ARGB(255, 255, 255, 255))
        end
        
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:DrawCircles(x, y, z, radius, color)

  if self.Menu.Draw.Lfc then
  
    local v1 = Vector(x, y, z)
    local v2 = Vector(cameraPos.x, cameraPos.y, cameraPos.z)
    local tPos = v1-(v1-v2):normalized()*radius
    local sPos = WorldToScreen(D3DXVECTOR3(tPos.x, tPos.y, tPos.z))
    
    if OnScreen({x = sPos.x, y = sPos.y}, {x = sPos.x, y = sPos.y}) then
      self:DrawCircles2(x, y, z, radius, color) 
    end
    
  else
    DrawCircle(x, y, z, radius, color)
  end
  
end

function HTTF_Viktor:DrawCircles2(x, y, z, radius, color)

  local length = 75
  local radius = radius*.92
  local quality = math.max(8,self:round(180/math.deg((math.asin((length/(2*radius)))))))
  local quality = 2*math.pi/quality
  local points = {}
  
  for theta = 0, 2*math.pi+quality, quality do
  
    local c = WorldToScreen(D3DXVECTOR3(x+radius*math.cos(theta), y, z-radius*math.sin(theta)))
    points[#points + 1] = D3DXVECTOR2(c.x, c.y)
  end
  
  DrawLines2(points, 1, color or 4294967295)
end

function HTTF_Viktor:round(num)

  if num >= 0 then
    return math.floor(num+.5)
  else
    return math.ceil(num-.5)
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Viktor:Animation(unit, animation)

  if not unit.isMe then
    return
  end
  
  if animation == "recall" then
    self.IsRecall = true
  elseif animation == "recall_winddown" or animation == "Run" or animation == "Spell1" or animation == "Spell2" or animation == "Spell3" or animation == "Spell4" then
    self.IsRecall = false
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:CreateObj(object)

  if object.name == "Storm" then
    self.Storm = object
  elseif object.name == "Viktor_ChaosStorm_green.troy" then
    self.Storm = object
  else
    --print(object.name)
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:DeleteObj(object)

  if object.name == "Viktor_ChaosStorm_green.troy" then
    self.Storm = nil
  else
    --print(object.name)
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:ProcessSpell(unit, spell)

  if not unit.isMe then
    return
  end
  
  if spell.name == "ViktorPowerTransfer" then
    DelayAction(function() self:OrbwalkReset() end, spell.windUpTime)
  end
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function OnSendPacket(p)

  if HTTF_Viktor.Storm == nil and HTTF_Viktor.Menu.Misc.BlockR then
  
    if GetGameVersion():find("5.23.0.239") and p.header == 0x0A then
      p.pos = 31
      
      if p:Decode1() == 0xEC and not HTTF_Viktor:RHit() then
        HTTF_Viktor:ScriptMsg("Spell R is blocked")
        p:Block()
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Viktor:RHit()

  for i, enemy in ipairs(self.EnemyHeroes) do
  
    if GetDistance(enemy, mousePos) <= self.R.radius then
      return true
    end
    
  end
  
  return false
end
