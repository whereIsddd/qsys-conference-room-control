-- Conference-room UCI logic for Q-SYS Designer 10.4.
-- This first stage keeps all state local to the UCI for Emulate-mode testing.

local displayOn = false
local source = "None"

local function volumePercent()
  return math.floor(Controls.Volume.Position * 100 + 0.5)
end

local function updateStatus()
  local display = displayOn and "ON" or "OFF"
  local audio = Controls.Mute.Boolean and "MUTED" or "ON"
  Controls.DisplayStatus.String = string.format(
    "DISPLAY: %s\nSOURCE: %s\nAUDIO: %s\nVOLUME: %d%%",
    display, source, audio, volumePercent()
  )
end

Controls.DisplayOn.EventHandler = function()
  displayOn = true
  updateStatus()
  print("Display: ON")
end

Controls.DisplayOff.EventHandler = function()
  displayOn = false
  updateStatus()
  print("Display: OFF")
end

Controls.Laptop.EventHandler = function()
  source = "Laptop"
  updateStatus()
  print("Source: Laptop")
end

Controls.RoomPC.EventHandler = function()
  source = "Room PC"
  updateStatus()
  print("Source: Room PC")
end

Controls.Wireless.EventHandler = function()
  source = "Wireless"
  updateStatus()
  print("Source: Wireless")
end

Controls.Mute.EventHandler = function()
  updateStatus()
  print("Mute:", Controls.Mute.Boolean)
end

Controls.Volume.EventHandler = function()
  updateStatus()
  print("Volume:", volumePercent())
end

updateStatus()
