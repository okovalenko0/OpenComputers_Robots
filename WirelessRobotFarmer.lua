local component = require('component')
local keyboard = require('keyboard')
local shl = require('shell')
local event = require('event')
local robot = require('robot')
local m = component.modem -- get primary modem component

local list = {
      --движение робота
      ['w'] = function(name_key) robot.forward() end,
      ['s']= function(name_key) robot.back() end,
      ['a']= function(name_key) robot.turnRight() end,
      ['d']= function(name_key) robot.turnLeft() end,
      ['lshift']= function(name_key) robot.up() end,
      ['lcontrol']= function(name_key) robot.down() end
}
 
function Start()
  m.open(6791)
  CheckPort()
end
 
function CheckPort()
  if m.isOpen(6791) then
    print("Порты открыты. можно работать.")
  else
    print("Ошибка в открытии порта.")
    os.exit()
  end
end
 

Start()
while true do  
e, _, _, code, _, msg = event.pull()

  if e == 'key_down' then
   os.sleep(0.2)
   name_key = tostring(keyboard.keys[code])
    if list[name_key] then
       list[name_key]()
    end
  elseif e == 'modem_message' then 
  if msg == "StartFarm" then
    shl.execute("pastebin run eDssVHzT")
   end
  end
 end
