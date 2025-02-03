local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()

local Window = OrionLib:MakeWindow({Name = "Budgie Hub | Survive in area 51", HidePremium = true, IntroEnabled = false, SaveConfig = false, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

game.Players.LocalPlayer.leaderstats.Cell:GetPropertyChangedSignal("Value"):Connect(function()
 if game.Players.LocalPlayer.leaderstats.Cell.Value <= -1 then
   game:Shutdown()
 end
end)

game:GetService("RunService").Heartbeat:Connect(function()
 game:GetService("GuiService"):ClearError()
end)

Tab:AddToggle({
 Name = "Hit aura",
 Default = false,
 Callback = function(Value)
togl = Value
   while togl and task.wait(0.1) do
 pcall(function()
 local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
  if tool then
    pcall(function()
local parts = workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 40)
  for _, part in ipairs(parts) do
     if part.Parent:IsA("Model") and part.Parent:FindFirstChildOfClass("Humanoid") and part.Parent ~= game.Players.LocalPlayer.Character then
local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
local args = {
    [1] = "Head",
    [2] = humanoid,
    [3] = humanoid.Parent.Head,
    [4] = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"),
    [5] = Vector3.new(0.937201201915741, -0.3045220375061035, -0.17005980014801025)
}

game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").GunScript_Server.InflictTarget:FireServer(unpack(args))
      end
     end
    end)
   end
end)
    end
 end    
})

Tab:AddButton({
 Name = "Instant regeneration",
 Callback = function()
game.Players.LocalPlayer.Character.Humanoid.HealthChanged:Connect(function()
  firetouchinterest(game.Players.LocalPlayer.Character.Head, Workspace.Misc["Blizzard Armor"].Head, 1)
  firetouchinterest(game.Players.LocalPlayer.Character.Head, Workspace.Misc["Blizzard Armor"].Head, 0)
end)
   end    
})

Tab:AddToggle({
 Name = "Instant regeneration (toggle)",
 Default = false,
 Callback = function(Value)
loip = Value
 while loip and task.wait() do
   firetouchinterest(game.Players.LocalPlayer.Character.Head, Workspace.Misc["Blizzard Armor"].Head, 1)
   firetouchinterest(game.Players.LocalPlayer.Character.Head, Workspace.Misc["Blizzard Armor"].Head, 0)
 end
   end    
})

Tab:AddDropdown({
	Name = "Get weapon",
	Default = "1",
	Options = {"Ice crossbow", "Volcano", "Rocket Launcher", "LXW", "Hex gun", '<p><font size="25">Deleted</font></p>', "Corrupted rifle", "Scarecrown skull"},
	Callback = function(Value)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(625, 1147, 750)
 task.wait(0.3)
        if Value == "Ice crossbow" then
firetouchinterest(game.Players.LocalPlayer.Character.Head, Workspace.IceZone.GetIceCrossbow.Head, 0)
firetouchinterest(game.Players.LocalPlayer.Character.Head, Workspace.IceZone.GetIceCrossbow.Head, 1)
        elseif Value == "Volcano" then
firetouchinterest(game.Players.LocalPlayer.Character.Head, Workspace.LavaZone.Escape.Head, 0)
firetouchinterest(game.Players.LocalPlayer.Character.Head, Workspace.LavaZone.Escape.Head, 1)
        elseif Value == "Rocket Launcher" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-354, 1073, 411)
        elseif Value == "LXW" then
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Workspace.Exit, 0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Workspace.Exit, 1)
        elseif Value == "Hex gun" then
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Workspace["Floor 2"].GetHEXGun.Head, 0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Workspace["Floor 2"].GetHEXGun.Head, 1)
        elseif Value == "Corrupted rifle" then
if Workspace:FindFirstChild("NightCity") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace.NightCity.Exit.Head.CFrame
  else

end
       elseif Value == "Starecrown skull" then
 if workspace:FindFirstChild("GetScarecrowSkull") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace["GetScarecrowSkull"].CFrame
 end
        end
	end    
})

Tab:AddButton({
 Name = "Safe incinerator",
 Callback = function()
Workspace.Incinerator.Challenge1.Model.Model.ChallengeGate:Destroy()
Workspace.Incinerator.Acid:Destroy()

for _, bull in ipairs(Workspace.Bulls:GetDescendants()) do
  bull:Destroy()
end
   end    
})

Tab:AddButton({
 Name = "Unpack all boxes",
 Callback = function()
for _, promp in ipairs(workspace:GetDescendants()) do
  if promp:IsA("ProximityPrompt") and promp.Parent.Name == "SupplyBox" then
promp.MaxActivationDistance = 100
promp.Enabled = true
promp.ClickablePrompt = true

game.Workspace[game.Players.LocalPlayer.Name]:SetPrimaryPartCFrame(promp.Parent.CFrame)

  task.wait(0.2)
fireproximityprompt(promp, 1e9)
 end
end
   end    
})
