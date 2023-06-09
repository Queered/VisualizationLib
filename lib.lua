local Visualization = {}

local camera = game.Workspace.CurrentCamera
local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

function Visualization.visualizeVector3(vector3, parent)
  local part = Instance.new("Part")
  part.Size = Vector3.new(0.2, 0.2, 0.2)
  part.Position = vector3
  part.Parent = parent
  part.Anchored = true
  part.CanCollide = false
  part.Material = Enum.Material.Neon
  part.BrickColor = BrickColor.new("Bright red")

  local cameraTarget = CFrame.new(vector3)
  camera.CameraType = Enum.CameraType.Scriptable
  camera.CFrame = cameraTarget
  camera.Focus = cameraTarget
end

function Visualization.visualizeCFrame(cframe, parent)
  local part = Instance.new("Part")
  part.Size = Vector3.new(1, 1, 1)
  part.CFrame = cframe
  part.Parent = parent
  part.Anchored = true
  part.CanCollide = false
  part.Material = Enum.Material.Neon
  part.BrickColor = BrickColor.new("Bright blue")

  local cameraTarget = cframe
  camera.CameraType = Enum.CameraType.Scriptable
  camera.CFrame = cameraTarget * CFrame.new(0, 0, 10)
  camera.Focus = cameraTarget
end

function Visualization.createButton(name, object, visualizeFunction)
  local button = Instance.new("TextButton")
  button.Parent = gui
  button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  button.Size = UDim2.new(0, 100, 0, 50)
  button.Position = UDim2.new(0.5, -50, 0.5, -25)
  button.Text = name
  button.FontSize = Enum.FontSize.Size18
  button.TextColor3 = Color3.fromRGB(0, 0, 0)

  button.MouseButton1Click:Connect(function()
    visualizeFunction(object, game.Workspace)
  end)
end

function Visualization.visualizePlayerPosition(parent)
  local character = game.Players.LocalPlayer.Character
  local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
  Visualization.visualizeVector3(humanoidRootPart.Position, parent)
end

return Visualization
