local Version = "1.27"

if myHero.charName ~= "Ezreal" then
  return
end

class "HTTF_Ezreal"

require 'HPrediction'

function HTTF_Ezreal:ScriptMsg(msg)
  print("<font color=\"#daa520\"><b>HTTF Ezreal:</b></font> <font color=\"#FFFFFF\">"..msg.."</font>")
end

---------------------------------------------------------------------------------

local Host = "raw.github.com"

local ScriptFilePath = SCRIPT_PATH..GetCurrentEnv().FILE_NAME

local ScriptPath = "/BolHTTF/BoL/master/HTTF/HTTF Ezreal.lua".."?rand="..math.random(1,10000)
local UpdateURL = "https://"..Host..ScriptPath

local VersionPath = "/BolHTTF/BoL/master/HTTF/Version/HTTF Ezreal.version".."?rand="..math.random(1,10000)
local VersionData = tonumber(GetWebResult(Host, VersionPath))

if VersionData then

  ServerVersion = type(VersionData) == "number" and VersionData or nil
  
  if ServerVersion then
  
    if tonumber(Version) < ServerVersion then
      HTTF_Ezreal:ScriptMsg("New version available: v"..VersionData)
      HTTF_Ezreal:ScriptMsg("Updating, please don't press F9.")
      DelayAction(function() DownloadFile(UpdateURL, ScriptFilePath, function () HTTF_Ezreal:ScriptMsg("Successfully updated.: v"..Version.." => v"..VersionData..", Press F9 twice to load the updated version.") end) end, 3)
      return
    else
      HTTF_Ezreal:ScriptMsg("You've got the latest version: v"..Version)
    end
    
  else
    HTTF_Ezreal:ScriptMsg("Error downloading server version.")
  end
  
else
  HTTF_Ezreal:ScriptMsg("Error downloading version info.")
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function OnLoad()

  local h = HTTF_Ezreal()
  
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Ezreal:__init()
  self:Variables()
  self:Menu()
  DelayAction(function() self:Orbwalk() end, 1)
  
  AddTickCallback(function() self:Tick() end)
  AddDrawCallback(function() self:Draw() end)
  AddAnimationCallback(function(unit, animation) self:Animation(unit, animation) end)
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Ezreal:Variables()
  self.HPred = HPrediction()
  self.HP_Q = HPSkillshot({type = "DelayLine", delay = 0.25, range = 1200, speed = 2000, collisionH = false, collisionM = true, width = 120})
  
  self.IsRecall = false
  self.RebornLoaded, self.RevampedLoaded, self.MMALoaded, self.NOWLoaded, self.SxOrbLoaded, self.SOWLoaded = false, false, false, false, false, false, false
  
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
  
  self.Q = {range = 1200, width = 120, ready}
  self.W = {range = 1050, width = 160, ready}
  self.E = {range = 475, ready}
  self.R = {range = 1000, width = 320, ready}
  self.I = {range = 600, ready}
  self.S = {range = 560, ready}
  
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
  
  self.QTS = TargetSelector(TARGET_LESS_CAST, self.Q.range, DAMAGE_PHYSICAL, false)
  self.WTS = TargetSelector(TARGET_LESS_CAST, self.W.range, DAMAGE_MAGIC, false)
  self.RTS = TargetSelector(TARGET_LESS_CAST, self.R.range, DAMAGE_MAGIC, false)
  self.STS = TargetSelector(TARGET_LOW_HP, self.S.range)
  
  self.EnemyHeroes = GetEnemyHeroes()
  self.EnemyMinions = minionManager(MINION_ENEMY, self.Q.range, myHero, MINION_SORT_MAXHEALTH_DEC)
  self.JungleMobs = minionManager(MINION_JUNGLE, self.Q.range, myHero, MINION_SORT_MAXHEALTH_DEC)
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:Menu()

  self.Menu = scriptConfig("HTTF Ezreal", "HTTF Ezreal")
  
  self.Menu:addSubMenu("HitChance Settings", "HitChance")
  
    self.Menu.HitChance:addSubMenu("Combo", "Combo")
      self.Menu.HitChance.Combo:addParam("Q", "Q HitChacne (Default value = 1)", SCRIPT_PARAM_SLICE, 1, 1, 3, 2)
      self.Menu.HitChance.Combo:addParam("W", "W HitChacne (Default value = 1.2)", SCRIPT_PARAM_SLICE, 1.2, 1, 3, 2)
      
    self.Menu.HitChance:addSubMenu("Harass", "Harass")
      self.Menu.HitChance.Harass:addParam("Q", "Q HitChacne (Default value = 1.4)", SCRIPT_PARAM_SLICE, 1.4, 1, 3, 2)
      self.Menu.HitChance.Harass:addParam("W", "W HitChacne (Default value = 1.6)", SCRIPT_PARAM_SLICE, 1.6, 1, 3, 2)
      
  self.Menu:addSubMenu("Combo Settings", "Combo")
    self.Menu.Combo:addParam("On", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
      self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Combo:addParam("Info", "Use Q if Mana Percent > x%", SCRIPT_PARAM_INFO, "")
    self.Menu.Combo:addParam("Q2", "Default value = 0", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
      self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Combo:addParam("Info", "Use W if Mana Percent > x%", SCRIPT_PARAM_INFO, "")
    self.Menu.Combo:addParam("W2", "Default value = 30", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
      self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Combo:addParam("R", "Use R (single target)", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Combo:addParam("R2", "Use R (multiple target)", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Combo:addParam("R3", "Use R min count", SCRIPT_PARAM_SLICE, 3, 2, 5, 0)
      --[[self.Menu.Combo:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Combo:addParam("Item", "Use Items", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Combo:addParam("BRK", "Use BRK if my own HP < x%", SCRIPT_PARAM_SLICE, 40, 0, 100, 0)]]
      
  self.Menu:addSubMenu("Clear Settings", "Clear")
  
    self.Menu.Clear:addSubMenu("Lane Clear Settings", "Farm")
      self.Menu.Clear.Farm:addParam("On", "Lane Claer", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('V'))
        self.Menu.Clear.Farm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.Menu.Clear.Farm:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Clear.Farm:addParam("Info", "Use Q if Mana Percent > x%", SCRIPT_PARAM_INFO, "")
      self.Menu.Clear.Farm:addParam("Q2", "Default value = 80", SCRIPT_PARAM_SLICE, 80, 0, 100, 0)
      
    self.Menu.Clear:addSubMenu("Jungle Clear Settings", "JFarm")
      self.Menu.Clear.JFarm:addParam("On", "Jungle Claer", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('V'))
        self.Menu.Clear.JFarm:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.Menu.Clear.JFarm:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
      
  self.Menu:addSubMenu("Harass Settings", "Harass")
    self.Menu.Harass:addParam("On", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('C'))
    self.Menu.Harass:addParam("On2", "Harass Toggle", SCRIPT_PARAM_ONKEYTOGGLE, false, GetKey('H'))
      self.Menu.Harass:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Harass:addParam("Info", "Use Q if Mana Percent > x%", SCRIPT_PARAM_INFO, "")
    self.Menu.Harass:addParam("Q2", "Default value = 0", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
      self.Menu.Harass:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Harass:addParam("Info", "Use W if Mana Percent > x%", SCRIPT_PARAM_INFO, "")
    self.Menu.Harass:addParam("W2", "Default value = 40", SCRIPT_PARAM_SLICE, 40, 0, 100, 0)
    
  self.Menu:addSubMenu("LastHit Settings", "LastHit")
    self.Menu.LastHit:addParam("On", "LastHit", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('X'))
      self.Menu.LastHit:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, false)
    self.Menu.LastHit:addParam("Info", "Use Q if Mana Percent > x%", SCRIPT_PARAM_INFO, "")
    self.Menu.LastHit:addParam("Q2", "Default value = 85", SCRIPT_PARAM_SLICE, 85, 0, 100, 0)
    
  self.Menu:addSubMenu("Jungle Steal Settings", "JSteal")
    self.Menu.JSteal:addParam("On", "Jungle Steal", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('X'))
    self.Menu.JSteal:addParam("On2", "Jungle Steal Toggle", SCRIPT_PARAM_ONKEYTOGGLE, true, GetKey('N'))
      self.Menu.JSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.JSteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    if self.Smite ~= nil then
      self.Menu.JSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.JSteal:addParam("S", "Use Smite", SCRIPT_PARAM_ONOFF, true)
      self.Menu.JSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.JSteal:addParam("Always", "Always Use Auto Q and Smite\n(Baron & Dragon)", SCRIPT_PARAM_ONOFF, true)
    else
      self.Menu.JSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.JSteal:addParam("Always", "Always Use Auto Q\n(Baron & Dragon)", SCRIPT_PARAM_ONOFF, true)
    end
    
  self.Menu:addSubMenu("KillSteal Settings", "KillSteal")
    self.Menu.KillSteal:addParam("On", "KillSteal", SCRIPT_PARAM_ONOFF, true)
      self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.KillSteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
      self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.KillSteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    if self.Ignite ~= nil then
      self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.KillSteal:addParam("I", "Use Ignite", SCRIPT_PARAM_ONOFF, true)
    end
    if self.Smite ~= nil then
      self.Menu.KillSteal:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.KillSteal:addParam("S", "Use Stalker's Blade", SCRIPT_PARAM_ONOFF, true)
    end
    
  self.Menu:addSubMenu("Flee Settings", "Flee")
    self.Menu.Flee:addParam("On", "Flee (Only Use KillSteal)", SCRIPT_PARAM_ONKEYDOWN, false, GetKey('G'))
    
  self.Menu:addSubMenu("Draw Settings", "Draw")
  
    self.Menu.Draw:addSubMenu("Draw Target", "Target")
      self.Menu.Draw.Target:addParam("Q", "Draw Q Target", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Draw.Target:addParam("W", "Draw W Target", SCRIPT_PARAM_ONOFF, false)
      self.Menu.Draw.Target:addParam("R", "Draw R Target", SCRIPT_PARAM_ONOFF, false)
      
    self.Menu.Draw:addSubMenu("Draw Predicted Position", "PP")
      self.Menu.Draw.PP:addParam("Q", "Draw Q Pos", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Draw.PP:addParam("W", "Draw W Pos", SCRIPT_PARAM_ONOFF, false)
      self.Menu.Draw.PP:addParam("R", "Draw R Pos", SCRIPT_PARAM_ONOFF, false)
      self.Menu.Draw.PP:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
      self.Menu.Draw.PP:addParam("Line", "Draw Line to Pos", SCRIPT_PARAM_ONOFF, true)
      
    self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    
    self.Menu.Draw:addParam("On", "Draw", SCRIPT_PARAM_ONOFF, true)
      self.Menu.Draw:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    self.Menu.Draw:addParam("AA", "Draw Attack range", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Draw:addParam("Q", "Draw Q range", SCRIPT_PARAM_ONOFF, true)
    self.Menu.Draw:addParam("W", "Draw W range", SCRIPT_PARAM_ONOFF, false)
    self.Menu.Draw:addParam("E", "Draw E range", SCRIPT_PARAM_ONOFF, false)
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
  self.Menu.JSteal.On = false
  self.Menu.JSteal.On2 = false
  self.Menu.Flee.On = false
  
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:Orbwalk()

  if _G.AutoCarry and _G.Reborn_Initialised then
    self.RebornLoaded = true
    self:ScriptMsg("Found SAC: Reborn.")
  elseif _G.Reborn_Loaded then
    DelayAction(function() self:Orbwalk() end, 1)
  elseif _G.MMA_IsLoaded then
    self.MMALoaded = true
    self:ScriptMsg("Found MMA.")
  elseif _G.NebelwolfisOrbWalkerLoaded then
    self.NOWLoaded = true
    self:ScriptMsg("Found Nebelwolfi's Orbwalk.")
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

function HTTF_Ezreal:Tick()

  if myHero.dead then
    return
  end
  
  self:Checks()
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
  
  if self.Menu.JSteal.On or self.Menu.JSteal.On2 then
    self:JSteal()
  end
  
  if self.Menu.JSteal.Always then
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

function HTTF_Ezreal:Checks()

  self.Q.ready = myHero:CanUseSpell(_Q) == READY
  self.W.ready = myHero:CanUseSpell(_W) == READY
  self.E.ready = myHero:CanUseSpell(_E) == READY
  self.R.ready = myHero:CanUseSpell(_R) == READY
  self.I.ready = self.Ignite ~= nil and myHero:CanUseSpell(self.Ignite) == READY
  self.S.ready = self.Smite ~= nil and myHero:CanUseSpell(self.Smite) == READY
  
  self.Q.level = myHero:GetSpellData(_Q).level
  self.W.level = myHero:GetSpellData(_W).level
  self.E.level = myHero:GetSpellData(_E).level
  self.R.level = myHero:GetSpellData(_R).level
  
  self.EnemyMinions:update()
  self.JungleMobs:update()
  
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:Targets()

  --[[local Target = nil
  
  if self.RebornLoaded then
    Target = _G.AutoCarry.Crosshair:GetTarget()
  elseif self.RevampedLoaded then
    Target = _G.AutoCarry.Orbwalker.target
  elseif self.MMALoaded then
    Target = _G.MMA_Target
  elseif self.SxOrbLoaded then
    Target = self.SxOrb:GetTarget()
  elseif self.SOWLoaded then
    Target = self.SOWVP:GetTarget()
  end
  
  if Target and Target.type == myHero.type and ValidTarget(Target, self:TrueRange(Target)) then
    self.QTarget = Target
    self.WTarget = Target
  else]]
    self.QTS:update()
    self.WTS:update()
    self.QTarget = self.QTS.target
    self.WTarget = self.WTS.target
  --end
  
  self.RTS:update()
  self.STS:update()
  self.RTarget = self.RTS.target
  self.STarget = self.STS.target
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:OrbwalkCanMove()

  if self.RebornLoaded then
    return _G.AutoCarry.Orbwalker:CanMove()
  elseif self.MMALoaded then
    return _G.MMA_CanMove
  elseif self.NOWLoaded then
    return _G.NebelwolfisOrbWalker:TimeToMove()
  elseif self.SxOrbLoaded then
    return self.SxOrb:CanMove()
  elseif self.SOWLoaded then
    return self.SOWVP:CanMove()
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:Combo()

  local ComboQ = self.Menu.Combo.Q
  local ComboQ2 = self.Menu.Combo.Q2
  local ComboW = self.Menu.Combo.W
  local ComboW2 = self.Menu.Combo.W2
  --local ComboItem = self.Menu.Combo.Item

  if self.QTarget ~= nil and ComboQ and self.Q.ready and ComboQ2 <= self:ManaPercent() and ValidTarget(self.QTarget, self.Q.range) then
    self:CastQ(self.QTarget, "Combo")
        
    if self.QHitChance ~= nil and self.QHitChance <= 0 then
    
      for i, enemy in ipairs(self.EnemyHeroes) do
      
        if ValidTarget(enemy, self.Q.range) then
          self:CastQ(enemy, "Combo")
        end
        
      end
      
    end
    
  end
  
  if self.WTarget ~= nil and ComboW and self.W.ready and ComboW2 <= self:ManaPercent() and ValidTarget(self.WTarget, self.W.range) then
    self:CastW(self.WTarget, "Combo")
  end
  
  if self.RTarget ~= nil and self.R.ready and ValidTarget(self.RTarget, self.R.range) then
  
    local ComboR = self.Menu.Combo.R
    local ComboR2 = self.Menu.Combo.R2
    
    if ComboR then
    
      local QTargetDmg = ComboQ and self.Q.ready and ValidTarget(self.RTarget, self.Q.range) and self:GetDmg("Q", self.RTarget) or 0
      local WTargetDmg = ComboW and self.W.ready and ValidTarget(self.RTarget, self.W.range) and self:GetDmg("W", self.RTarget) or 0
      local RTargetDmg = self:GetDmg("R", self.RTarget)
      
      if RTargetDmg >= self.RTarget.health then
        self:CastR(self.RTarget, "Combo")
      elseif ComboQ2 <= self:ManaPercent() and QTargetDmg+RTargetDmg >= self.RTarget.health then
      
        local QPos, QHitChance = self.HPred:GetPredict(self.HPred.Presets["Ezreal"]["Q"], self.RTarget, myHero)
        
        if QHitChance > 0 then
          self:CastR(self.RTarget, "Combo")
        end

      elseif ComboW2 <= self:ManaPercent() and WTargetDmg+RTargetDmg >= self.RTarget.health then
      
        local WPos, WHitChance = self.HPred:GetPredict(self.HPred.Presets["Ezreal"]["W"], self.RTarget, myHero)
        
        if WHitChance > 0 then
          self:CastR(self.RTarget, "Combo")
        end

      elseif ComboQ2+ComboW2 <= self:ManaPercent() and QTargetDmg+WTargetDmg+RTargetDmg >= self.RTarget.health then
      
        local QPos, QHitChance = self.HPred:GetPredict(self.HPred.Presets["Ezreal"]["Q"], self.RTarget, myHero)
        local WPos, WHitChance = self.HPred:GetPredict(self.HPred.Presets["Ezreal"]["W"], self.RTarget, myHero)
        
        if QHitChance >= self.Menu.HitChance.Combo.Q and WHitChance > 0 or  QHitChance > 0 and WHitChance >= self.Menu.HitChance.Combo.W then
          self:CastR(self.RTarget, "Combo")
        end

      end

    end
    
    if ComboR2 then
      self:CastR(self.RTarget, "Combo2")
    end
    
  end
  
  --[[if self.STarget ~= nil and ComboItem then
  
    if self.Items["Stalker"].ready and ValidTarget(self.STarget, self.S.range) then
      self:CastS(self.STarget)
    end
    
    local ComboBRK = self.Menu.Combo.BRK
    
    if ComboBRK >= self:HealthPercent() then
    
      local BCTargetDmg = self:GetDmg("BC", self.STarget)
      local BRKTargetDmg = self:GetDmg("BRK", self.STarget)
      
      if self.Items["BC"].ready and ValidTarget(self.STarget, self.Items["BC"].range) then
        self:CastBC(self.STarget)
      elseif self.Items["BRK"].ready and ValidTarget(self.STarget, self.Items["BRK"].range) then
        self:CastBRK(self.STarget)
      end
      
    end
    
  end]]
  
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:Farm()

  local FarmQ = self.Menu.Clear.Farm.Q
  local FarmQ2 = self.Menu.Clear.Farm.Q2
  
  if FarmQ and self.Q.ready and FarmQ2 <= self:ManaPercent() then
    
    for i, minion in pairs(self.EnemyMinions.objects) do
    
      local QMinionDmg = self:GetDmg("Q", minion)
      
      if QMinionDmg >= minion.health and ValidTarget(minion, self.Q.range) then
        self:CastQ(minion, "LastHit")
      end
      
    end
    
    for i, minion in pairs(self.EnemyMinions.objects) do
    
      local AAMinionDmg = self:GetDmg("AA", minion)
      local QMinionDmg = self:GetDmg("Q", minion)
      
      if QMinionDmg+2.5*AAMinionDmg <= minion.health and ValidTarget(minion, self.Q.range) then
        self:CastQ(minion)
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:JFarm()

  local JFarmQ = self.Menu.Clear.JFarm.Q
  
  if self.Q.ready and JFarmQ then
  
    local LargeJunglemob = nil

    for i, junglemob in pairs(self.JungleMobs.objects) do
    
      for j = 1, #self.FocusJungleNames do

        if junglemob.name == self.FocusJungleNames[j] then
          LargeJunglemob = junglemob
          break
          break
        end
        
      end
      
    end
    
    if LargeJunglemob ~= nil and GetDistance(LargeJunglemob, mousePos) <= self.Q.range and ValidTarget(LargeJunglemob, self.Q.range) then
      self:CastQ(LargeJunglemob)
    end
    
    for i, junglemob in pairs(self.JungleMobs.objects) do
    
      if ValidTarget(junglemob, self.Q.range) then
        self:CastQ(junglemob)
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:Harass()

  local HarassQ = self.Menu.Harass.Q
  local HarassQ2 = self.Menu.Harass.Q2
  local HarassW = self.Menu.Harass.W
  local HarassW2 = self.Menu.Harass.W2
  
  if self.QTarget ~= nil and HarassQ and self.Q.ready and HarassQ2 <= self:ManaPercent() then
    
    if ValidTarget(self.QTarget, self.Q.range) then
      self:CastQ(self.QTarget, "Harass")
    end
    
  end
  
  if self.WTarget ~= nil and HarassW and self.W.ready and HarassW2 <= self:ManaPercent() and ValidTarget(self.WTarget, self.W.range) then
    self:CastW(self.WTarget, "Harass")
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:LastHit()

  local LastHitQ = self.Menu.LastHit.Q
  local LastHitQ2 = self.Menu.LastHit.Q2
  
  if LastHitQ and self.Q.ready and LastHitQ2 <= self:ManaPercent() then
  
    for i, minion in pairs(self.EnemyMinions.objects) do
    
      local QMinionDmg = self:GetDmg("Q", minion)
      
      if QMinionDmg >= minion.health and ValidTarget(minion, self.Q.range) then
        self:CastQ(minion, "LastHit")
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:JSteal()

  local JStealQ = self.Menu.JSteal.Q
  local JStealS = self.Menu.JSteal.S
  
  if self.S.ready and JStealS then
  
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
  
  if self.Q.ready and JStealQ then
  
    for i, junglemob in pairs(self.JungleMobs.objects) do
    
      local QJunglemobDmg = self:GetDmg("Q", junglemob)
      
      for j = 1, #self.FocusJungleNames do
      
        if junglemob.name == self.FocusJungleNames[j] and QJunglemobDmg >= junglemob.health and ValidTarget(junglemob, self.Q.range) then
          self:CastQ(junglemob, "JSteal")
        end
        
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:JstealAlways()
  
  if self.S.ready then
  
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
  
  if self.Q.ready then
  
    for i, junglemob in pairs(self.JungleMobs.objects) do
    
      local QJunglemobDmg = self:GetDmg("Q", junglemob)
      
      for j = 1, #self.FocusJungleNames do
      
        if (junglemob.name == "SRU_Baron12.1.1" or junglemob.name == "SRU_Dragon6.1.1") and QJunglemobDmg >= junglemob.health and ValidTarget(junglemob, self.Q.range) then
          self:CastQ(junglemob, "JSteal")
        end
        
      end
      
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:KillSteal()

  local KillStealQ = self.Menu.KillSteal.Q
  local KillStealW = self.Menu.KillSteal.W
  local KillStealI = self.Menu.KillSteal.I
  local KillStealS = self.Menu.KillSteal.S
  
  for i, enemy in ipairs(self.EnemyHeroes) do
  
    local QTargetDmg = self:GetDmg("Q", enemy)
    local WTargetDmg = self:GetDmg("W", enemy)
    local ITargetDmg = self:GetDmg("IGNITE", enemy)
    local SBTargetDmg = self:GetDmg("STALKER", enemy)
    
    if self.I.ready and KillStealI and ITargetDmg >= enemy.health and ValidTarget(enemy, self.I.range) then
      self:CastI(enemy)
    end
    
    --[[if self.Items["Stalker"].ready and KillStealS and SBTargetDmg >= enemy.health and ValidTarget(enemy, self.S.range) then
      self:CastS(enemy)
      return
    end]]
    
    if self.Q.ready and KillStealQ and QTargetDmg >= enemy.health and ValidTarget(enemy, self.Q.range) then
      self:CastQ(enemy, "KillSteal")
    end
    
    if self.W.ready and KillStealW and WTargetDmg >= enemy.health and ValidTarget(enemy, self.W.range) then
      self:CastW(enemy, "KillSteal")
    end
    
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:Flee()

  local FleePos = myHero+(Vector(mousePos)-myHero):normalized()*300
  
  self:CastE(FleePos)
  self:MoveToMouse()
  
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:HealthPercent()
  return (myHero.health/myHero.maxHealth)*100
end

function HTTF_Ezreal:ManaPercent()
  return (myHero.mana/myHero.maxMana)*100
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:AddRange(unit)
  return unit.boundingRadius
end

function HTTF_Ezreal:TrueRange(enemy)
  return myHero.range+self:AddRange(myHero)+self:AddRange(enemy)
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:GetDmg(spell, enemy)

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
    ADDmg = 20*self.Q.level+15+1.1*TotalDmg+.4*AP    
  elseif spell == "W" then
    APDmg = 45*self.W.level+25+.8*AP
  elseif spell == "E" then
    APDmg = 50*self.E.level+25+.75*AP
  elseif spell == "R" then
    APDmg = 200*self.R.level+150+AddDmg+.9*AP
  end
  
  local TrueDmg = ADDmg*(1-ArmorPercent)+APDmg*(1-MagicArmorPercent)
  
  return TrueDmg
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Ezreal:CastQ(unit, mode)

  if unit.dead or mode ~= "JSteal" and mode ~= "KillSteal" and not self:OrbwalkCanMove() then
    return
  end
  
  self.QPos, self.QHitChance = self.HPred:GetPredict(self.HP_Q, unit, myHero)
  
  if mode == "Combo" and self.QHitChance >= self.Menu.HitChance.Combo.Q or mode == "Harass" and self.QHitChance >= self.Menu.HitChance.Harass.Q or (mode == "LastHit" or mode == "JSteal" or mode == "KillSteal" or mode == nil) and self.QHitChance > 0 then
    CastSpell(_Q, self.QPos.x, self.QPos.z)
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:CastW(unit, mode)

  if unit.dead or mode ~= "KillSteal" and not self:OrbwalkCanMove() then
    return
  end
  
  self.WPos, self.WHitChance = self.HPred:GetPredict(self.HPred.Presets["Ezreal"]["W"], unit, myHero)
  
  if mode == "Combo" and self.WHitChance >= self.Menu.HitChance.Combo.W or mode == "Harass" and self.WHitChance >= self.Menu.HitChance.Harass.W or (mode == "KillSteal" or mode == nil) and self.WHitChance > 0 then
    CastSpell(_W, self.WPos.x, self.WPos.z)
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:CastE(pos)
  CastSpell(_E, pos.x, pos.z)
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:CastR(unit, mode)

  if unit.dead then
    return
  end
  
  local ComboR3 = self.Menu.Combo.R3
  
  if mode == "Combo2" then
    self.RPos, self.RHitChance, self.RNoH = self.HPred:GetPredict(self.HPred.Presets["Ezreal"]["R"], unit, myHero, true)
  else
    self.RPos, self.RHitChance = self.HPred:GetPredict(self.HPred.Presets["Ezreal"]["R"], unit, myHero)
  end
  
  if (mode == "Combo" or mode == nil) and self.RHitChance > 0 or mode == "Combo2" and self.RNoH >= ComboR3 then
    CastSpell(_R, self.RPos.x, self.RPos.z)
  end
  
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:CastI(enemy)

  if enemy.dead then
    return
  end
  
  CastSpell(self.Ignite, enemy)
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:CastS(enemy)

  if enemy.dead then
    return
  end
  
  CastSpell(self.Smite, enemy)
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:CastBC(enemy)

  if enemy.dead then
    return
  end
  
  CastSpell(self.Items["BC"].slot, enemy)
end

---------------------------------------------------------------------------------

function HTTF_Ezreal:CastBRK(enemy)

  if enemy.dead then
    return
  end
  
  CastSpell(self.Items["BRK"].slot, enemy)
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Ezreal:MoveToMouse()

  if mousePos and GetDistance(mousePos) <= 100 then
    self.MousePos = myHero+(Vector(mousePos)-myHero):normalized()*300
  else
    self.MousePos = mousePos
  end
  
  myHero:MoveTo(self.MousePos.x, self.MousePos.z)
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

function HTTF_Ezreal:Draw()

  if not self.Menu.Draw.On or myHero.dead then
    return
  end
  
  if self.Menu.Harass.On2 then
    DrawText("Harass Toggle: On", 20, 1600, 150, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  else
    DrawText("Harass Toggle: Off", 20, 1600, 150, ARGB(0xFF, 0xFF, 0x80, 0x80))
  end
  
  if self.Menu.JSteal.On2 then
    DrawText("Jungle Steal Toggle: On", 20, 1600, 200, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  else
    DrawText("Jungle Steal Toggle: Off", 20, 1600, 200, ARGB(0xFF, 0xFF, 0x80, 0x80))
  end
  
  if self.Menu.Draw.Target.Q and self.QTarget ~= nil then
    DrawCircle(self.QTarget.x, self.QTarget.y, self.QTarget.z, self.Q.width/2, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  end
  
  if self.Menu.Draw.Target.W and self.WTarget ~= nil then
    DrawCircle(self.WTarget.x, self.WTarget.y, self.WTarget.z, self.W.width/2, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  end
  
  if self.Menu.Draw.Target.R and self.RTarget ~= nil then
    DrawCircle(self.RTarget.x, self.RTarget.y, self.RTarget.z, self.R.width/2, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  end
  
  if self.QHitChance ~= nil then
  
    if self.QHitChance == -1 then
      self.Qcolor = ARGB(0xFF, 0x00, 0x00, 0x00)
    elseif self.QHitChance < 1 then
      self.Qcolor = ARGB(0xFF, 0xFF, 0x00, 0x00)
    elseif self.QHitChance == 3 then
      self.Qcolor = ARGB(0xFF, 0x00, 0x54, 0xFF)
    elseif self.QHitChance >= 2 then
      self.Qcolor = ARGB(0xFF, 0x1D, 0xDB, 0x16)
    elseif self.QHitChance >= 1 then
      self.Qcolor = ARGB(0xFF, 0xFF, 0xE4, 0x00)
    end
  
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
  
  if self.Menu.Draw.PP.Q and self.QPos ~= nil then
  
    DrawCircle(self.QPos.x, self.QPos.y, self.QPos.z, self.Q.width/2, self.Qcolor)
    
    if self.Menu.Draw.PP.Line then
      DrawLine3D(myHero.x, myHero.y, myHero.z, self.QPos.x, self.QPos.y, self.QPos.z, 2, self.Qcolor)
    end
    
    self.QPos = nil
  end
  
  if self.Menu.Draw.PP.W and self.WPos ~= nil then
  
    DrawCircle(self.WPos.x, self.WPos.y, self.WPos.z, self.W.width/2, self.Wcolor)
    
    if self.Menu.Draw.PP.Line then
      DrawLine3D(myHero.x, myHero.y, myHero.z, self.WPos.x, self.WPos.y, self.WPos.z, 2, self.Wcolor)
    end
    
    self.WPos = nil
  end
  
  if self.Menu.Draw.PP.R and self.RPos ~= nil then
  
    DrawCircle(self.RPos.x, self.RPos.y, self.RPos.z, self.R.width/2, self.Rcolor)
    
    if self.Menu.Draw.PP.Line then
      DrawLine3D(myHero.x, myHero.y, myHero.z, self.RPos.x, self.RPos.y, self.RPos.z, 2, self.Rcolor)
    end
    
    self.RPos = nil
  end
  
  if self.Menu.Draw.Hitchance then
  
    if self.QHitChance ~= nil then
      DrawText("Q HitChance: "..self.QHitChance, 20, 1250, 550, self.Qcolor)
      self.QHitChance = nil
    end
    
    if self.WHitChance ~= nil then
      DrawText("W HitChance: "..self.WHitChance, 20, 1250, 600, self.Wcolor)
      self.WHitChance = nil
    end
    
    if self.RHitChance ~= nil then
      DrawText("R HitChance: "..self.RHitChance, 20, 1250, 650, self.Rcolor)
      self.RHitChance = nil
    end
    
  end
  
  if self.Menu.Draw.AA then
    DrawCircle(myHero.x, myHero.y, myHero.z, myHero.range+self:AddRange(myHero), ARGB(0xFF, 0, 0xFF, 0))
  end
  
  if self.Menu.Draw.Q then
    DrawCircle(myHero.x, myHero.y, myHero.z, self.Q.range, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  end
  
  if self.Menu.Draw.W then
    DrawCircle(myHero.x, myHero.y, myHero.z, self.W.range, ARGB(0xFF, 0xFF, 0xFF, 0xFF))
  end
  
  if self.Menu.Draw.E and self.E.ready then
    DrawCircle(myHero.x, myHero.y, myHero.z, self.E.range, ARGB(0xFF, 0x00, 0x00, 0xFF))
  end
  
  if self.Menu.Draw.I and self.I.ready then
    DrawCircle(myHero.x, myHero.y, myHero.z, self.I.range, ARGB(0xFF, 0xFF, 0x24, 0x24))
  end
  
  if self.Menu.Draw.S and self.S.ready and (self.Menu.JSteal.On or self.Menu.JSteal.On2) and self.Menu.JSteal.S then
    DrawCircle(myHero.x, myHero.y, myHero.z, self.S.range, ARGB(0xFF, 0xFF, 0x14, 0x93))
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
    
      if enemy == nil then
        return
      end
      
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
---------------------------------------------------------------------------------

function HTTF_Ezreal:Animation(unit, animation)

  if not unit.isMe then
    return
  end
  
  if animation == "recall" then
    self.IsRecall = true
  elseif animation == "recall_winddown" or animation == "Run" or animation == "Spell1" or animation == "Spell2" or animation == "Spell3" or animation == "Spell4" then
    self.IsRecall = false
  end
  
end
