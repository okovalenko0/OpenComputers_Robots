local component = require('component')
local robot = require('robot')
local m = component.modem 

m.open(6791)
m.setWakeMessage('')
m.setStrength(50000)

while true do
robot.use()
os.sleep(0.1)
end
